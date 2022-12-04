# Universal gates

It is quite well known that any logic circuit can be built using only NAND gates.
For instance, an XNOR gate is equivalent to the following construction:

> ![XNOR gate composed from 5 NAND gates](docs/nand-xnor-s.jpg)

Such gates are called universal. Any Boolean function with 2 inputs and 1 output can be built from at most 5 NAND gates.

We can also define a gate <i>U</i><sub>21</sub> that is universal in a stricter sense, such that any Boolean
function with 2 inputs and 1 output is realized with just a single copy of <i>U</i><sub>21</sub>.
This gate would obviously need more than 2 inputs, but it's usually still more economical than the <i>2k</i> inputs
and <i>k</i> outputs used from a set of NAND chips (1≤<i>k</i>≤5).

> ![U21(a,b,c,d)=(a&~b)^c^d](docs/u21-s.jpg)

As an example, this is how we get the NAND of <i>p</i> and <i>q</i> and the XNOR of <i>p</i> and <i>q</i>
by wiring up <i>U</i><sub>21</sub>'s four inputs <i>a</i>, <i>b</i>, <i>c</i> and <i>d</i>
to a suitable combination of <i>p</i>, <i>q</i>, 0 and 1:

> ![a=p, b=q, c=p, d=1](docs/u21-nand-s.jpg) &nbsp; &nbsp; &nbsp; ![a=1, b=q, c=p, d=q](docs/u21-xnor-s.jpg)
>
> ⮟ &nbsp; ⮟ &nbsp; ⮟ &nbsp; ⮟ &nbsp; ⮟ &nbsp; ⮟ &nbsp; ⮟ &nbsp; ⮟ &nbsp; ⮟ &nbsp; ⮟ &nbsp; ⮟
>
> ![NAND gate](docs/nand-s.jpg) &nbsp; &nbsp; &nbsp; ![XNOR gate](docs/xnor-s.jpg)

So <i>U</i><sub>21</sub> stands in for any combinatorial logic with 2 inputs and 1 output.
And any Boolean function with 3 inputs and 1 output can be built with at most 3 copies of <i>U</i><sub>21</sub>.
But that doesn't stop us from creating a gate <i>U</i><sub>31</sub> that's <i>even</i> more universal
and does so with a single copy when wired correctly:

> ![U31(a,b,c,d,e,f)=(((a^~b)&c)|(d^e))^((d|~a)&b)^f](docs/u31-s.jpg)

This repository contains a chip design with four independent gates
<i>U</i><sub>21</sub>, <i>U</i><sub>31</sub>, <i>U</i><sub>41</sub> and <i>U</i><sub>22</sub>
where each <i>U<sub>ij</sub></i> can be wired to act as an arbitrary function
with <i>i</i> inputs and <i>j</i> outputs.
It uses the caravel framework and is hardened for the gf180mcuC technology platform.
