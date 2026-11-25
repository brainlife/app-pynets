<h1 align="center">PyNets</h1>

<p align="center">
  Ensembles of structural and/or functional connectomes and their graph measures from preprocessed DWI and BOLD data, sampled across atlases, models and thresholds.
</p>

<p align="center">
  <a href="https://doi.org/10.25663/brainlife.app.486"><img src="https://img.shields.io/badge/brainlife.io-run%20this%20App-2b6cb0" alt="Run on brainlife.io"></a>
  <a href="https://doi.org/10.25663/brainlife.app.486"><img src="https://img.shields.io/badge/DOI-10.25663%2Fbrainlife.app.486-blue" alt="DOI"></a>
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD%20spec-v1.1-green" alt="ABCD spec v1.1"></a>
  <a href="https://github.com/dPys/PyNets"><img src="https://img.shields.io/badge/PyNets-orange" alt="PyNets"></a>
  <img src="https://img.shields.io/badge/license-MIT-lightgrey" alt="MIT license">
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Estimates ensembles of structural (DWI) and/or functional (BOLD) connectomes and their graph measures from a skull-stripped T1-weighted image with PyNets, sampling across atlases, models and thresholds.**

Runs the PyNets post-processing workflow (built on Nilearn and DIPY) on preprocessed BOLD and/or DWI data together with the T1w anatomy, building connectomes for every combination of the chosen atlases, connectivity models, tracking or time-series settings and thresholds, then computing graph measures and optional embeddings. At least one of task (BOLD) or DWI must be supplied. PyNets is a post-processing tool; inputs should already be preprocessed. Expect long runtimes (up to 48 hours) for large ensembles.

| | |
|---|---|
| **Inputs** | `neuro/anat/t1w` · `neuro/func/task` (optional) · `neuro/regressors` (optional) · `neuro/dwi` (optional) · `neuro/mask` (optional) · `neuro/rois` (optional) · `neuro/parcellation/volume` (optional) |
| **Outputs** | `raw` |
| **Container** | `dpys/pynets:ba6f4a4c33b1c7751bc8c781ef0191db3d2b0520` |
| **Resources** | 1 CPUs · 56 GB memory · 48 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.486](https://doi.org/10.25663/brainlife.app.486) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `anat` | `neuro/anat/t1w` | yes | skull-stripped anatomical input |
| `task` | `neuro/func/task` | no | It should be in native/T1w space. Either task or dwi (or both) input should be present. |
| `regressors` | `neuro/regressors` | no | Confound regressor to reduce noise in the time-series estimation for the graph. If you include this, you should also include a bold functional image with an corresponding number of volumes. |
| `dwi` | `neuro/dwi` | no | Used for structural connectomes. Should be in native diffusion space. Either task or dwi (or both) input should be present. |
| `mask` | `neuro/mask` (brain) | no | Optional binarized Nifti1Image in T1w space. This will be estimated automatically if not provided. |
| `waymask` | `neuro/rois` | no | Binarized Nifti1Image ROI in MNI-space to constrain tractography. |
| `uatlas` | `neuro/parcellation/volume` | no | A volume parcellation file may be included instead of specifying a fetched or local atlas name as a configuration option. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `raw` | A base directory to save workflow outputs. |

<details>
<summary><b>Parameters</b> (24)</summary>

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
| `es` | string | `mean median maximum` | Include this option if you are running functional connectometry using parcel labels and wish to specify the name of a specific function (i.e. other than the mean, the default) to reduce the label's time-series. Options are: `sum`, `mean`, `median`, `minimum`, `maximum`, `variance`, `standard_deviation`. |
| `dg` | string | `det prob` | Include this flag to manually specify the statistical approach to tracking for dmri connectome estimation. Options are: `det` (deterministic),`prob` (probabilistic), `close` (closest-peak) |
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

</details>

<!-- brainlife-app:end -->

## How it works

[PyNets](https://pynets.readthedocs.io/) is a reproducible post-processing workflow for structural and functional connectome ensemble learning. It uses the Nilearn and DIPY fMRI and dMRI libraries to sample individual structural and functional connectome estimates across many methodological choices. For every combination of the atlases, connectivity models, tracking or time-series settings and thresholds you choose, it builds a connectome, computes graph measures and, optionally, embeds the ensemble into feature vectors.

The App runs the multimodal workflow: structural connectomes from the DWI, functional connectomes from the BOLD series, or both (and, with both, optional multiplex analysis across modalities, `mplx`). At least one of the two must be given.

Because PyNets is a post-processing workflow, the inputs must already be preprocessed. At a minimum the DWI, BOLD and T1w images should be motion-corrected, and ideally also susceptibility-corrected and denoised.

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.486](https://doi.org/10.25663/brainlife.app.486) and choose:

- a skull-stripped T1-weighted image (`neuro/anat/t1w`), in its native scanner anatomical space;
- a BOLD series (`neuro/func/task`) in the same space as the T1w, and/or a DWI series (`neuro/dwi`), ideally in its native diffusion space (it can also be co-registered to the T1w) and with at least one b0 volume;
- optionally, confound regressors (`neuro/regressors`, with the same number of volumes as the BOLD), a T1w brain mask (`neuro/mask`, estimated automatically if not given) and one or more volume parcellations (`neuro/parcellation/volume`) to use instead of, or in addition to, named atlases.

Then set the ensemble you want to sample:

- `atlas`: one or more atlas names, one per line (for example the Yeo-Schaefer `net-<network>_scale-<n>` parcellations, `DesikanKlein2012`, `AALTzourioMazoyer2002`, `destrieux2009_rois`, …; see the [PyNets usage guide](https://pynets.readthedocs.io/en/latest/usage.html));
- `mod`: connectivity models: `csa`, `csd`, `sfm` for dMRI; `corr`, `cov`, `sps`, `partcorr` and the skggm estimators for fMRI;
- dMRI tracking: direction getter `dg` (`det`, `prob`, `close`), minimum fibre length `ml` and error margin `em`;
- fMRI time series: extraction strategy `es`, high-pass filter `hp` and smoothing `sm`;
- graph thresholding and normalisation: `min_thr`/`max_thr`/`step_thr` (multi-thresholding) or `thr`, with `dt`, `mst` or `df` for density, minimum-spanning-tree or disparity-filter thresholding, `norm`, `bin` and the fragmentation protection `p`;
- `n`: an optional Yeo-Schaefer resting-state network; `spheres` to use spheres instead of parcels as nodes; `embed` and `plt` for embeddings and plots.

Press **Execute**. All PyNets derivatives are archived to your project as one `raw` dataset tagged `derivatives`. Large ensembles can take up to 48 hours and need about 56 GB of memory.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/), [`jq`](https://jqlang.github.io/jq/) and brainlife.io's `bl2bids` tool, which `main` calls first. `main` builds a Singularity image from `docker://dpys/pynets:ba6f4a4c33b1c7751bc8c781ef0191db3d2b0520` in `$SCRATCH`, `$SINGULARITY_CACHEDIR` or `$WORK` and runs PyNets with 24 processes and 46 GB of memory.

1. Clone this repository and check out the App's branch: `git checkout v2.7`.
2. Create `config.json` with the paths to your inputs and the options you want, for example:

   ```json
   {
       "t1": "/input/anat/t1.nii.gz",
       "bold": "/input/func/bold.nii.gz",
       "dwi": "/input/dwi/dwi.nii.gz",
       "bvecs": "/input/dwi/dwi.bvecs",
       "bvals": "/input/dwi/dwi.bvals",
       "atlas": "DesikanKlein2012",
       "mod": "csd corr",
       "dg": "det prob",
       "min_thr": 0.2,
       "max_thr": 1,
       "step_thr": 0.2,
       "embed": true,
       "_inputs": [
           { "id": "anat", "meta": { "subject": "01" } },
           { "id": "dwi", "meta": { "subject": "01", "session": "1" } }
       ]
   }
   ```

   The subject and session used as the PyNets ID are read from the `_inputs` list that brainlife.io writes into `config.json`.

3. Run the App:

   ```bash
   ./main
   ```

## Outputs

`output/` is the PyNets derivatives directory: the connectome ensembles and their graph measures (and embeddings and plots, if requested) for the subject. See the [PyNets documentation](https://pynets.readthedocs.io/) for its layout.

## Troubleshooting

- **`At least one of BOLD and DWI are required!`**: neither a BOLD nor a DWI input was given. Provide a BOLD and/or a DWI input.

## Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

A PyNets manuscript is in preparation; for now, please cite all uses with the following entry, and cite brainlife.io:

- Pisner D, Hammonds R. PyNets: a reproducible workflow for structural and functional connectome ensemble learning. Poster presented at the 26th Annual Meeting of the Organization for Human Brain Mapping (2020). [github.com/dPys/PyNets](https://github.com/dPys/PyNets)
- PyNets. brainlife.io App. [doi:10.25663/brainlife.app.486](https://doi.org/10.25663/brainlife.app.486)
- Pisner D, Hammonds R. PyNets: A Reproducible Workflow for Structural and Functional Connectome Ensemble Learning. Poster, 26th Annual Meeting of the Organization for Human Brain Mapping (2020). https://github.com/dPys/PyNets
- Garyfallidis et al. Dipy, a library for the analysis of diffusion MRI data. *Frontiers in Neuroinformatics* 8 (2014). [doi:10.3389/fninf.2014.00008](https://doi.org/10.3389/fninf.2014.00008)
- Abraham et al. Machine learning for neuroimaging with scikit-learn. *Frontiers in Neuroinformatics* 8 (2014). [doi:10.3389/fninf.2014.00014](https://doi.org/10.3389/fninf.2014.00014)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Derek Pisner

**Contributors:** Soichi Hayashi, Giulia Bertò

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## License

MIT, Copyright (c) 2020 Derek Pisner. PyNets is distributed under its own [license](https://github.com/dPys/PyNets).
