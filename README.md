# LinkFunctions.jl
[![Build Status](https://github.com/giovannitinervia9/LinkFunctions.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/giovannitinervia9/LinkFunctions.jl/actions/workflows/CI.yml?query=branch%3Amain)

A Julia package providing a comprehensive collection of link functions for Generalized Linear Models (GLMs) and other statistical modeling contexts.

This work is heavily based on the implementation of link functions in [GLM.jl](https://github.com/JuliaStats/GLM.jl), but provides them as a standalone module for use in other packages implementing statistical models. The key enhancements over GLM.jl include explicit implementation of derivatives of both link functions and inverse link functions, and the introduction of link functions for parameters with arbitrarily constrained support: bounded intervals $(a, b)$, upper-bounded intervals $(-\infty, b)$, and lower-bounded intervals $(a, \infty)$.

## Installation

```julia
using Pkg
add "LinkFunctions"
```

## Quick Start

```julia
using LinkFunctions

# Create different link functions
logit = LogitLink()
bounded = BoundedLink(0.1, 0.9)
lower = LowerBoundedLink(0.0)

# Apply transformations
θ = 0.7
η = linkfun(logit, θ)          # Forward transformation
θ_back = linkinv(logit, η)     # Inverse transformation

# Compute derivatives
dθ_dη = theta_eta(logit, η)         # ∂θ/∂η
d²θ_dη² = theta2_eta2(logit, η)     # ∂²θ/∂η²
dη_dθ = eta_theta(logit, θ)         # ∂η/∂θ  
d²η_dθ² = eta2_theta2(logit, θ)     # ∂²η/∂θ²
```

## Interface

All link functions implement the following interface:

### Core Functions

- `linkfun(link, θ)`: Forward link transformation $\eta = g(\theta)$
- `linkinv(link, η)`: Inverse link transformation $\theta = g^{-1}(\eta)$

### Derivatives

- `theta_eta(link, η)`: First derivative $\partial \theta / \partial \eta$
- `theta2_eta2(link, η)`: Second derivative $\partial^2 \theta / \partial^2 \eta^2$
- `eta_theta(link, θ)`: First derivative $\partial \eta / \partial \theta$
- `eta2_theta2(link, θ)`: Second derivative $\partial^2 \eta / \partial^2 \theta^2$

## Available Link Functions

### Standard Links (from GLM.jl)

| Link Function | Parameter Domain | Transformation $\eta = g(\theta)$ |
|:-------------|:-----------------|:-------------------------|
| `IdentityLink()` | $\mathbb{R}$ | $\eta = \theta$ |
| `LogitLink()` | $(0, 1)$ | $\eta = \log(\theta/(1-\theta))$ |
| `ProbitLink()` | $(0, 1)$ | $\eta = \Phi^{-1}(\theta)$ |
| `CloglogLink()` | $(0, 1)$ | $\eta = \log(-\log(1-\theta))$ |
| `CauchitLink()` | $(0, 1)$ | $\eta = \tan(\pi(\theta-1/2))$ |
| `LogLink()` | $(0, \infty)$ | $\eta = \log(\theta)$ |
| `SqrtLink()` | $[0, \infty)$ | $\eta = \sqrt{\theta}$ |
| `InverseLink()` | $(0, \infty)$ | $\eta = 1/\theta$ |
| `InverseSquareLink()` | $(0, \infty)$ | $\eta = 1/\theta^2$ |
| `PowerLink(p)` | $(0, \infty)$ | $\eta = \theta^p$ |

### Bounded Parameter Links (New in This Package)

| Link Function | Parameter Domain | Transformation η = g(\theta) |
|:-------------|:-----------------|:-------------------------|
| `BoundedLink(a, b)` | $(a, b)$ | $\eta = \log((\theta-a)/(b-\theta))$ |
| `LowerBoundedLink(a)` | $(a, ∞)$ | $\eta = \log(\theta-a)$ |
| `UpperBoundedLink(b)` | $(-∞, b)$ | $\eta = \log(b-\theta)$ |

## Examples

### Working with Bounded Parameters

```julia
# Parameter constrained to (0.1, 0.9)
link = BoundedLink(0.1, 0.9)
θ = 0.3
η = linkfun(link, θ)
println("θ = $θ maps to η = $η")

# Parameter with lower bound at 5
lower_link = LowerBoundedLink(5.0)
θ = 10.0
η = linkfun(lower_link, θ)
θ_recovered = linkinv(lower_link, η)
println("Recovery check: θ = $θ, recovered = $θ_recovered")
```

### Computing Derivatives for Optimization

```julia
# Useful for Newton-Raphson and other optimization algorithms
link = LogitLink()
θ = 0.6

# First and second derivatives
dη_dθ = eta_theta(link, θ)
d²η_dθ² = eta2_theta2(link, θ)

println("First derivative: $dη_dθ")
println("Second derivative: $d²η_dθ²")
```

### Vectorized Operations

```julia
link = LogLink()
θ_vec = [1.0, 2.0, 3.0, 4.0]

# All operations broadcast naturally
η_vec = linkfun.(link, θ_vec)
θ_recovered = linkinv.(link, η_vec)
derivatives = theta_eta.(link, η_vec)
```

## Mathematical Details

### Link Function Theory

A link function $g(\cdot)$ connects a parameter $\theta$ of a response variable to a linear predictor $\eta$ through the relationship $\eta = g(\theta)$. The link function must be:

1. **Monotonic**: Either strictly increasing or decreasing
2. **Differentiable**: To enable gradient-based optimization  
3. **Domain-appropriate**: Map from the parameter space to the real line

## Related Packages

- [GLM.jl](https://github.com/JuliaStats/GLM.jl): Generalized linear models in Julia
- [StatsModels.jl](https://github.com/JuliaStats/StatsModels.jl): Statistical model specification
- [Distributions.jl](https://github.com/JuliaStats/Distributions.jl): Probability distributions

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## License

This package is licensed under the MIT License - see the LICENSE file for details.