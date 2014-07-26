# price of call option
callprice.bs <- function (s,x,r,sigma,e.exp,t)
{
  d.pos <- log(s/x) + (r + 0.5 * sigma^2) * (t.exp - t)
  d.pos <- d.pos/(sigma * ( t.exp - t)^0.5)
  d.neg <- d.pos  - sigma * (t.exp -t) ^ 0.5)
s * pnorm(d.pos) - x * exp( -r * (t.exp -t)) * pnorm(d.neg)
}