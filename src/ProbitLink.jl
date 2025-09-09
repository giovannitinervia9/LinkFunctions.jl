# Establish existence of ProbitLink link
# struct ProbitLink <: Link end

# linkfun
# linkfun(::ProbitLink, θ::Real) = -sqrt2 * erfcinv(2*θ)

# linkinv
# linkinv(::ProbitLink, η::Real) = erfc(-η / sqrt2) / 2

# theta_eta
# theta_eta(::ProbitLink, η::Real) = 

# theta2_eta2
# theta2_eta2(::ProbitLink, η::Real) = 

# eta_theta
# eta_theta(::ProbitLink, θ::Real) = 

# eta2_theta2
# eta2_theta2(::ProbitLink, θ::Real) = 