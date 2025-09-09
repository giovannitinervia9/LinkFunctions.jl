# Establish existence of IdentityLink link
struct IdentityLink <: Link end

# linkfun
linkfun(::IdentityLink, θ::Real) = θ

# eta_theta
eta_theta(::IdentityLink, θ::Real) = one(θ)

# eta2_theta2
eta2_theta2(::IdentityLink, θ::Real) = zero(θ)

# linkinv
linkinv(::IdentityLink, η::Real) = η

# theta_eta
theta_eta(::IdentityLink, η::Real) = one(η)

# theta2_eta2
theta2_eta2(::IdentityLink, η::Real) = zero(η)

