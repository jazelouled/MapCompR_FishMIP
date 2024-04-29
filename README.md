# MapCompR: A toolbox to analyse and compare spatiotemporal maps

[![DOI](https://zenodo.org/badge/676980157.svg)](https://zenodo.org/doi/10.5281/zenodo.11082741)

<p align="justify">
The marine environment is subject to constant change and is heavily impacted by human activities such as climate change and overfishing. To better understand these changes and their potential consequences, modeling tools are often used, and spatially-explicit assessments are particularly relevant. These assessments provide easily accessible information for stakeholders, who can then use this information to adjust maritime activities in order to achieve sustainable use and exploitation of the ecosystem services offered by the ocean., The information provided by spatial modeling tools in an ecological context can take various forms, such as the spatial distribution of species biomass or abundance, the suitability of habitats for single or multiple species, the probability of species occurrence, etc. This spatial information can be obtained by several different methods, such as machine learning, e.g., Boosted Regression trees (BRT) or Bayesian additive regression trees (BART), statistical models, e.g., Generalized Additive Models or geostatistical models, or mechanistic models, e.g., Marine Ecosystem Models (MEM). A key and common aspect of all modelling frameworks is the evaluation of model outputs and the quantification of uncertainty, so the results are transmitted with the right amount of confidence to whom may use them. Here, we developed an R package MapComp which aims to compare spatial model outputs within an integrated and standardized workflow. In detail, we provide functions to: (1) compare spatial maps from different species, (2) compare spatial maps of the same species obtained with different methods, and (3) analyse model predictions.

## Installing the package
```
devtools::install_github("jazelouled/MapCompR_FishMIP")
library(MapCompR)
```

## Requirements  

<p align="justify">
For the correct operation of the repository it is necessary to have the following packages installed.

4. Install packages:

```  
install.packages(c("raster","lubridate", "data.table","ggplot2","gridExtra","tidyr","openair")) 
```

6. Session information
 ```
R version 4.2.1 (2022-06-23 ucrt)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19044)
 ```

