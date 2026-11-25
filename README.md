[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.346-blue.svg)](https://doi.org/10.25663/brainlife.app.346)

# app-pynets

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Estimates ensembles of structural (DWI) and/or functional (BOLD) connectomes and their graph measures from a skull-stripped T1-weighted image with PyNets, sampling across atlases, models and thresholds.**

Runs the PyNets post-processing workflow (built on Nilearn and DIPY) on preprocessed BOLD and/or DWI data together with the T1w anatomy, building connectomes for every combination of the chosen atlases, connectivity models, tracking or time-series settings and thresholds, then computing graph measures and optional embeddings. At least one of task (BOLD) or DWI must be supplied. PyNets is a post-processing tool; inputs should already be preprocessed. Expect long runtimes (up to 48 hours) for large ensembles.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.486](https://doi.org/10.25663/brainlife.app.486)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `anat` | `neuro/anat/t1w` | yes | skull-stripped anatomical input |
| `task` | `neuro/func/task` | no | It should be in native/T1w space. Either task or dwi (or both) input should be present. |
| `regressors` | `neuro/regressors` | no | Confound regressor to reduce noise in the time-series estimation for the graph. If you include this, you should also include a bold functional image with an corresponding number of volumes. |
| `dwi` | `neuro/dwi` | no | Used for structural connectomes. Should be in native diffusion space. Either task or dwi (or both) input should be present. |
| `mask` | `neuro/mask` (brain) | no | Optional binarized Nifti1Image in T1w space. This will be estimated automatically if not provided. |
| `waymask` | `neuro/rois` | no | Binarized Nifti1Image ROI in MNI-space to constrain tractography. |
| `uatlas` | `neuro/parcellation/volume` | no | A volume parcellation file may be included instead of specifying a fetched or local atlas name as a configuration option. |

| Output | Datatype | Description |
|---|---|---|
| `output` | `raw` | A base directory to save workflow outputs. |

| Parameter | Type | Default | Description |
|---|---|---|---|
| `min_thr` | number | `0.2` | Multi-thresholding minimum threshold. This should be a float value 0-1 and should be smaller than max_thr. If this field is set, max_thr and step_thr must also be set. |
| `max_thr` | number | `1` | Multi-thresholding maximum threshold. This should be a float value 0-1 and should be larger than min_thr. If this field is set, min_thr and step_thr must also be set. |
| `step_thr` | number | `0.2` | Multi-thresholding step size. If this field is set, min_thr and max_thr must also be set. |
| `thr` | number | `1` | Optionally specify a threshold indicating a proportion of weights to preserve in the graph. Defaults to no thresholding applied. |
| `atlas` | string | `'net-Cont_scale-200'
'net-Cont_scale-400'
'net-Cont_scale-600'
'net-Cont_scale-800'
'net-Default_scale-200'
'net-Default_scale-400'
'net-Default_scale-600'
'net-Default_scale-800'
'net-DorsAttn_scale-200'
'net-DorsAttn_scale-400'
'net-DorsAttn_scale-600'
'net-DorsAttn_scale-800'
'net-Limbic_scale-200'
'net-Limbic_scale-400'
'net-Limbic_scale-600'
'net-Limbic_scale-800'
'net-SalVentAttn_scale-200'
'net-SalVentAttn_scale-400'
'net-SalVentAttn_scale-600'
'net-SalVentAttn_scale-800'
'net-SomMot_scale-200'
'net-SomMot_scale-400'
'net-SomMot_scale-600'
'net-SomMot_scale-800'
'net-Vis_scale-200'
'net-Vis_scale-400'
'net-Vis_scale-600'
'net-Vis_scale-800'` | Enter atlas name in each. choose from 'atlas_aal', 'atlas_talairach_gyrus', 'atlas_talairach_ba', 'atlas_talairach_lobe', 'atlas_harvard_oxford', 'atlas_msdl', 'coords_dosenbach_2010', 'coords_power_2011', 'atlas_pauli_2017', 'destrieux2009_rois', 'BrainnetomeAtlasFan2016', 'VoxelwiseParcellationt0515kLeadDBS', 'Juelichgmthr252mmEickhoff2005', 'CorticalAreaParcellationfromRestingStateCorrelationsGordon2014', 'whole_brain_cluster_labels_PCA100', 'AICHAreorderedJoliot2015', 'HarvardOxfordThr252mmWholeBrainMakris2006', 'VoxelwiseParcellationt058kLeadDBS', 'MICCAI2012MultiAtlasLabelingWorkshopandChallengeNeuromorphometrics', 'AALTzourioMazoyer2002', 'DesikanKlein2012', 'AAL2zourioMazoyer2002', 'VoxelwiseParcellationt0435kLeadDBS', 'AICHAJoliot2015', 'whole_brain_cluster_labels_PCA200', 'RandomParcellationsc05meanalll43Craddock2011', 'sub-colin27_label-L2018_desc-scale1_atlas', 'sub-colin27_label-L2018_desc-scale2_atlas', 'sub-colin27_label-L2018_desc-scale3_atlas', 'sub-colin27_label-L2018_desc-scale4_atlas', 'sub-colin27_label-L2018_desc-scale5_atlas', 'rsn-intersection_res-200', 'rsn-intersection_res-400', 'rsn-intersection_res-600', 'rsn-intersection_res-800', 'rsn-language_res-200', 'rsn-language_res-400', 'rsn-language_res-600', 'rsn-language_res-800', 'rsn-union_res-200', 'rsn-union_res-400', 'rsn-union_res-600', 'rsn-union_res-800', 'rsn-ventral_res-200', 'rsn-ventral_res-400', 'rsn-ventral_res-600', 'rsn-ventral_res-800' Either one or more supported atlas names or one or more file paths to a volume parcellation is required. see https://pynets.readthedocs.io/en/latest/usage.html |
| `mst` | boolean | `false` | Optionally use this flag if you wish to apply local thresholding via the Minimum Spanning Tree approach. -thr values in this case correspond to a target density (if the -dt flag is also included), otherwise a target proportional threshold. |
| `dt` | boolean | `false` | Optionally use this flag if you wish to threshold to achieve a given density or densities indicated by the -thr and -min_thr, -max_thr, -step_thr flags, respectively. |
| `embed` | boolean | `true` | Optionally use this flag if you wish to embed the ensemble(s) produced into Euclidean feature vector(s). |
| `df` | boolean | `false` | Optionally use this flag if you wish to apply local thresholding via the disparity filter approach. -thr values in this case correspond to α. |
| `id` | string | `null` | A subject identifier. Must be an alphanumeric string and can be arbitrarily chosen. If your preprocessed data is in BIDS format where the subject ID is sub-XXXX and the session is ses-2, then specify XXXX_2. If the input data is in BIDS format, this field is unnecessary and with be parsed automatically. |
| `mod` | string | `csa sfm csd corr partcorr cov` | Specify connectivity estimation model. For fMRI, possible models include: corr for correlation, cov for covariance, sps for precision covariance, partcorr for partial correlation. skggm estimators are also exposed and include: QuicGraphicalLasso, QuicGraphicalLassoCV, QuicGraphicalLassoEBIC, and AdaptiveQuicGraphicalLasso. For dMRI, current models include csa, csd, and sfm. |
| `es` | string | `mean median maximum` | Include this option if you are running functional connectometry using parcel labels and wish to specify the name of a specific function (i.e. other than the mean, the default) to reduce the label's time-series. Options are: `sum`, `mean`, `median`, `mininum`, `maximum`, `variance`, `standard_deviation`. |
| `dg` | string | `det prob` | Include this flag to manually specify the statistical approach to tracking for dmri connectome estimation. Options are: `det` (deterministic),`prob` (probabilistic), `clos` (closest-peak) |
| `plt` | boolean | `false` | Activates plotting |
| `norm` | enum | `3` | Include this flag to normalize the graph(s). Options: `1`, `2`, `3`, `4`, `5`, `6`. |
| `p` | enum | `3` | Include this flag to implement various strategies for graph fragmentation protection (i.e. ensuring a connected graph before performing graph theoretical analysis). Options: `0`, `1`, `2`, `3`. |
| `n` | string | `null` | Optionally specify the name of any of the 2017 Yeo-Schaefer RSNs (7-network or 17-network): Vis, SomMot, DorsAttn, SalVentAttn, Limbic, Cont, Default, VisCent, VisPeri, SomMotA, SomMotB, DorsAttnA, DorsAttnB, SalVentAttnA, SalVentAttnB, LimbicOFC, LimbicTempPole, ContA, ContB, ContC, DefaultA, DefaultB, DefaultC, TempPar. |
| `mplx` | number | `2` | Levels of multiplex graph analysis (only) if both structural and diffusion connectometry is run simultaneously. Include this flag to perform multiplex graph analysis across structural-functional connectome modalities. Options include level: (0) Default, which is no multiplex analysis. (1) Create multiplex graphs using mutual information and adaptive thresholding; (2) Additionally perform multiplex graph embedding and analysis. |
| `ml` | string | `0 30 60` | (Metaparameter): Include this flag to manually specify a minimum tract length (mm) for dmri connectome tracking. Default is 20. Safe range: [0-150]. Depending on the tissue classifier used and the restrictiveness of the parcellation or any way-masking, values >100mm may fail if you are not tracking across nodes where long-range association fibers are to be expected biologically. |
| `em` | string | `5 10 15` | (Metaparameter): Distance (in the units of the streamlines, usually mm). If any coordinate in the streamline is within this distance from the center of any voxel in the ROI, the filtering criterion is set to `True` for this streamline, otherwise False. Defaults to the distance between the center of each voxel and the corner of the voxel. Default is 8. Safe range: [0-15]. |
| `hp` | string | `0 0.028 0.08` | Optionally specify high-pass filter thresholds to apply to node-extracted time-series for fMRI. Safe range: [0-0.15] for resting-state data. |
| `sm` | string | `0 3 6` | Optionally specify smoothing width(s) to apply to the node-extracted time-series for fMRI. Safe range: [0-8] |
| `spheres` | boolean | `false` | Include this flag to use spheres instead of parcels as nodes. Safe range: [0-8] |
| `bin` | boolean | `false` | Binarize the resulting graph such that edges are boolean and unweighted. |

Runtime: container `dpys/pynets:ba6f4a4c33b1c7751bc8c781ef0191db3d2b0520`; 1 CPUs; 56 GB memory; 48 h walltime.

Please cite:
- Pisner D, Hammonds R. PyNets: A Reproducible Workflow for Structural and Functional Connectome Ensemble Learning. Poster, 26th Annual Meeting of the Organization for Human Brain Mapping (2020). https://github.com/dPys/PyNets

<!-- brainlife-app:end -->

A Reproducible post-processing workflow for Structural and Functional Connectome Ensemble Learning. PyNets leverages Nilearn and Dipy fMRI and dMRI libraries to specify any of a variety of methodological choices and sampling individual structural and functional connectome estimates. PyNets is a post-processing workflow, which means that it can be run manually on virtually any preprocessed fMRI or dMRI data.

### Authors
- Derek Pisner (dpisner@utexas.edu)

### Contributors
- Soichi Hayashi (hayashis@iu.edu)
- Giulia Bertò (giulia.berto.4@gmail.com)

### Funding Acknowledgement
brainlife.io is publicly funded and for the sustainability of the project it is helpful to Acknowledge the use of the platform. We kindly ask that you acknowledge the funding below in your publications and code reusing this code.

[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### References
[PyNets](https://pynets.readthedocs.io/) 

### Citations
A manuscript is in preparation, but for now, please cite all uses with the following entry: 

Pisner, D., Hammonds R. (2020) PyNets: A Reproducible Workflow for Structural and Functional Connectome Ensemble Learning. Poster session presented at the 26th Annual Meeting of the Organization for Human Brain Mapping. https://github.com/dPys/PyNets.

## Running the App 
### On Brainlife.io
You can submit this App online at [https://doi.org/10.25663/bl.app.392](https://doi.org/10.25663/bl.app.392) via the "Execute" tab.

Inputs: \
This App runs the multimodal workflow, i.e. both Structural and Functional Connectome Ensemble Learning. The mandatory inputs are:
* a T1w anatomical image (can be preprocessed using any method, but should be in its native scanner anatomical space)
* a BOLD/EPI series (can be preprocessed using any method, but should in the same scanner anatomical space as the T1w)
* a DWI series (should ideally be in its native diffusion MRI (dMRI) space (though can also be co-registered to the T1w image) and must contain at least one B0 for reference)

PyNets is a post-processing workflow which means that input files should already be preprocessed. Minimally, all DWI, BOLD, and T1W image inputs should be motion-corrected (and ideally also susceptibility-corrected + denoised). 

Other optional inputs are: confound regressors, brain mask, parcellation, and binarized Regions of Interest (ROIs).  

Outputs: \
At the moment, the output is an unstructured dataset containing all the output files [ADD MORE INFO ABOUT OUTPUTS HERE]. 

### Running Locally (on your machine)
1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
        "anat": "./input/anat/t1.nii.gz",
	"task": "./input/func/bold.nii.gz",
	"dwi": "./input/dwi/dwi.nii.gz",
	"bvecs": "./input/bvecs/dwi.bvecs",
	"bvals": "./input/bva;s/dwi.bvals",
}
```

3. Launch the App by executing `main`

```bash
./main
```

### Output
The main output of this App is [ADD MORE INFO ABOUT OUTPUTS HERE].

### Dependencies
This App only requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies: [ADD INFO HERE].

#### MIT Copyright (c) 2020 Derek Pisner
