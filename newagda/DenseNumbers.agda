module DenseNumbers where



data Dense {X : Set} : Set where
    toDense : X → Dense X
    between : Dense X → Dense X → Dense X
