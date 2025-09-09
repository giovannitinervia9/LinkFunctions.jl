# Establish existence of PowerLink link
# parameters in (a, ∞)
struct PowerLink <: Link
    p::Float64
end

# linkfun
linkfun(link::PowerLink, θ::Real) = θ^link.p

# eta_theta
eta_theta(link::PowerLink, θ::Real) = link.p*θ^(link.p - 1)

# eta2_theta2
eta2_theta2(link::PowerLink, θ::Real) = (link.p - 1)*link.p*θ^(link.p - 2)

# linkinv
linkinv(link::PowerLink, η::Real) = η^inv(link.p)

# theta_eta
theta_eta(link::PowerLink, η::Real) = η^(inv(link.p) - 1)*inv(link.p)

# theta2_eta2
theta2_eta2(link::PowerLink, η::Real) = (link.p - 1)*η^(inv(link.p) - 2)*inv(link.p)^2