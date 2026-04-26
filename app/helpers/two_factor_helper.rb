# app/helpers/two_factor_helper.rb
module TwoFactorHelper
  def otp_qr_code(user, options = {})
    issuer = options[:issuer] || Rails.application.class.module_parent_name
    uri = user.otp_provisioning_uri(user.email, issuer: issuer)
    
    qrcode = RQRCode::QRCode.new(uri)
    qrcode.as_svg({
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: options[:size] || 4,
      standalone: true,
      use_path: true
    }.merge(options.except(:issuer, :size))).html_safe
  end
end