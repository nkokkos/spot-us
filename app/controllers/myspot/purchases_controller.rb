class Myspot::PurchasesController < ApplicationController
  include ActiveMerchant::Billing::Integrations

  before_filter :login_required, :except => [:paypal_ipn]
  ssl_required :create, :new
  before_filter :unpaid_donations_required, :except => [:paypal_ipn, :paypal_return]
  skip_before_filter :verify_authenticity_token, :only => [:paypal_ipn, :paypal_return]

  def new
    @donations = current_user.donations.unpaid
    @purchase = Purchase.new(:user       => current_user,
                             :donations  => @donations,
                             :spotus_donation => current_user.current_spotus_donation,
                             :first_name => current_user.first_name,
                             :last_name  => current_user.last_name)
    if cookies[:spotus_lite]
		render :layout=>'lite'
	else
		render :partial => "/myspot/purchases/purchase_form", :layout => false
	end
  end

  def create
    @purchase                 = Purchase.new(params[:purchase])
    @purchase.user            = current_user
    @donations                = current_user.donations.unpaid
    @purchase.donations       = @donations
    @purchase.spotus_donation = current_user.current_spotus_donation
    begin
      if @purchase.save
        set_social_notifier_cookie("donation")
        update_balance_cookie
        redirect_url = @donations && !@donations.empty? && @donations.first ? pitch_url(@donations.first.pitch) : myspot_donations_path
        redirect_to cookies[:spotus_lite] ? "/lite/#{cookies[:spotus_lite]}" : redirect_url
      else
        unless cookies[:spotus_lite]
          render :action => 'new'
        else
          render :action => 'new', :layout=>'lite'
        end
      end
    rescue ActiveMerchant::ActiveMerchantError, Purchase::GatewayError => e
      flash[:error] = e.message
      unless cookies[:spotus_lite]
        render :action => 'new'
      else
        render :action => 'new', :layout=>'lite'
      end
    end
  end

  def paypal_return
    update_balance_cookie
    if current_user.donations.unpaid.any?
      flash[:success] = "Thanks! Your donations will be marked paid when PayPal clears them."
    else
      flash[:success] = "Thanks! Your payment has been received."
    end
    redirect_to cookies[:spotus_lite] ? "/lite/#{cookies[:spotus_lite]}" : myspot_donations_path
  end

  def paypal_ipn
    notify = Paypal::Notification.new(request.raw_post)

    @spotus_donation = SpotusDonation.find_from_paypal(notify.params)
    @donations = Donation.find_all_from_paypal(notify.params)
    @user = @donations.first.user

    unless Purchase.valid_donations_for_user?(@user, [@donations, @spotus_donation].flatten.compact)
      logger.error("Invalid users for PayPal transaction 28C98632UU123291R")
      render :nothing => true and return
    end

    purchase = Purchase.new
    purchase.spotus_donation = @spotus_donation
    purchase.donations = @donations
    purchase.user = @user
    purchase.paypal_transaction_id = notify.transaction_id

    if notify.acknowledge
      if notify.complete? and purchase.total_amount == BigDecimal.new(notify.amount.to_s)
        purchase.save
        set_social_notifier_cookie("donation")
		
      else
        logger.error("PayPal acknowledgement was unpaid or the amounts didn't match for the following transaction: #{notify.params['txn_id']}")
      end
    else
      logger.error("Failed to verify Paypal's notification, please investigate: #{notify.params['txn_id']}")
    end

    render :nothing => true
  end

  protected

  def unpaid_donations_required
    # redirect_to myspot_donations_path if current_user.donations.unpaid.empty? && (current_user.unpaid_spotus_donation.nil? || current_user.unpaid_spotus_donation.amount <= 0)
  end

end
