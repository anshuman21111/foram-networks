# Late Cenozoic cooling restructured global marine plankton communities #
**Team members:** Adam Woodhouse<sup>1,2,*</sup>, Anshuman Swain<sup>3,4,5,6,*</sup>, William F. Fagan<sup>3</sup>, Andrew J. Fraass<sup>7</sup>, and Christopher M. Lowery<sup>1</sup>

<sup>1</sup>University of Texas Institute for Geophysics, University of Texas at Austin, Austin, TX 78712, U.S.A.
<sup>2</sup>School of Earth and Environment, University of Leeds, Woodhouse, Leeds LS2 9JT, U.K.
<sup>3</sup>Department of Biology, University of Maryland, College Park, MD 20742, U.S.A.
<sup>4</sup>Department of Organismic and Evolutionary Biology, Harvard University, Cambridge, MA 02138, U.S.A
<sup>5</sup>Museum of Comparative Zoology, Harvard University, Cambridge, MA 02138, U.S.A.
<sup>6</sup>Department of Paleobiology, National Museum of Natural History, Washington, D.C. 20013, U.S.A.
<sup>7</sup>School of Earth and Ocean Sciences, University of Victoria, Victoria, BC V8P 3E6, Canada
*equal contribution, first co-authors


**Keywords:** Triton, Foraminifera, Bipartite networks, Cenozoic



## Brief introduction to the project ##
The geographic ranges of marine plankton, including planktic foraminifera, diatoms, and dinoflagellates are already shifting poleward due to climate change. However, the extent to which plankton will shift and whether these poleward range extirpations will lead to extinction is unclear. Understanding the development of marine biodiversity patterns over geological time and the factors that influence them are key to contextualizing these current trends. The fossil record of the macroperforate planktonic foraminifera provides a rich and phylogenetically resolved dataset that provides unique opportunities for understanding marine biogeography dynamics. Here, we employ a bipartite network approach to quantify group diversity, latitudinal specialization, and latitudinal equitability for planktonic foraminifera over the last 8 Ma using Triton, a recently developed high-resolution global dataset of planktonic foraminiferal occurrences. Results depict a global, clade-wide equatorward shift in ecological and morphological communities across the last ~8 million years in response to temperature changes during late Cenozoic bipolar cryosphere formation. Collectively, the Triton data indicate the presence of a “latitudinal equitability gradient” (LEG) amongst planktonic foraminiferal functional groups which, importantly, is coupled to the latitudinal biodiversity gradient only through the past ~1 Ma. Prior to this time, LEGs indicate that higher latitudes promoted community equitability across ecological and morphological groups. Planktonic foraminiferal biogeographic dynamics within the recent geological past suggest poleward expansion of marine trophic levels under even the most conservative future global warming scenarios.


## Short Description of the files in this repository ##

**Base scripts** 
- `avg_sweeper.py`: Python wrapper code for easy parameter sweeps of `capped_energy_resc_refill.go`. The `Simulation` class is initialized by a given parameter sweep's parameters and contains all the methods needed to run, evaluate, and visualize the sweep. Sample workflow for all the plots in the paper is given in the code at the end. The class can be made to inherit from `Thread` for multithreading (currently not implemented, however). 
- `capped_energy_resc_refill_v2.go`: the base Go code to run the simulations. This is called by `avg_sweeper.py` repeatedly in parameter sweeps. Must be compiled locally before use; `avg_sweeper.py` expects the executable to be called `capped_energy_resc_refill.out` but this can be easily changed in the code. The setup is explained more in the paper.
- `evolution_sim.py`: Python wrapper code for easy parameter sweeps of `vision_2pops.go`, similar to `avg_sweeper.py`. The functions after the `Simulation` class were written before the class was made, so the class simply invokes the functions rather than duplicating the code. Sample workflow is shown in the code at the end, along with some visualization code for a figure from the paper.
- `vision_2pops.go`: the base Go code to run the two-population evolution verification simulations. This is called by `evolution_sim.py` repeatedly in the parameter sweeps. Must be compiled locally before use; `evolution_sim.py` expects the executable to be called `evolution_sim.out` but this can be easily changed in the code. The setup for these sweeps is explained more in the paper.
- `sweeper.sh`: deprecated Bash code for parameter sweeps from earlier development stages.
- `vision.go`, `vision_09182019.go`: deprecated Go code from earlier development stages.
