# Establish existence of ProbitLink link
struct ProbitLink <: Link end

# linkfun
linkfun(::ProbitLink, θ::Real) = invcdf(Normal(), θ)

# eta_theta
eta_theta(::ProbitLink, θ::Real) = 1.0 / pdf(Normal(), invcdf(Normal(), θ))

# eta2_theta2
eta2_theta2(::ProbitLink, θ::Real) = begin
    inv_cdf_val = invcdf(Normal(), θ)
    -inv_cdf_val / pdf(Normal(), inv_cdf_val)^2
end

# linkinv:
linkinv(::ProbitLink, η::Real) = cdf(Normal(), η)

# theta_eta
theta_eta(::ProbitLink, η::Real) = pdf(Normal(), η)

# theta2_eta2
theta2_eta2(::ProbitLink, η::Real) = -η * pdf(Normal(), η)


