# Late Cenozoic cooling restructured global marine plankton communities #
**Team members:** Adam Woodhouse<sup>1,2,* </sup>, Anshuman Swain<sup>3,4,5,6,* </sup>, William F. Fagan<sup>3</sup>, Andrew J. Fraass<sup>7</sup>, and Christopher M. Lowery<sup>1</sup>

<sup>1</sup>University of Texas Institute for Geophysics, University of Texas at Austin, Austin, TX 78712, U.S.A.
<sup>2</sup>School of Earth and Environment, University of Leeds, Woodhouse, Leeds LS2 9JT, U.K.
<sup>3</sup>Department of Biology, University of Maryland, College Park, MD 20742, U.S.A.
<sup>4</sup>Department of Organismic and Evolutionary Biology, Harvard University, Cambridge, MA 02138, U.S.A
<sup>5</sup>Museum of Comparative Zoology, Harvard University, Cambridge, MA 02138, U.S.A.
<sup>6</sup>Department of Paleobiology, National Museum of Natural History, Washington, D.C. 20013, U.S.A.
<sup>7</sup>School of Earth and Ocean Sciences, University of Victoria, Victoria, BC V8P 3E6, Canada

<sup>* </sup>equal contribution, first co-authors



**Keywords:** Triton, Foraminifera, Bipartite networks, Cenozoic



## Brief introduction to the project ##
This project aims to use foraminiferal global occurrence data for understanding marine biogeography dynamics using a bipartite network approach. We look at the problem by quantifying group diversity, latitudinal specialization, and latitudinal equitability for planktonic foraminifera over the last 8 Ma using Triton, a recently developed high-resolution global dataset of planktonic foraminiferal occurrences.


## Short Description of the files in this repository ##

**Base scripts in R** 
- `data partition.R`: Data partitioning script to categorize the original binned data from Triton based on 250 ky bin resolution. 
- `network properties.R`: Calculate network properties at the node level using 'bipartite' R library, but we will only adapt Degree, Species specificity Index and Paired Different Index for our purpose.
- `null models.R`: Null models for distribution in each time bin based on 'econullnetr' R package.
- `functional diversity.R`: Functional and species Shannon doversity caclulation.
- `linear models.R`: base code for linear models used in the work.
