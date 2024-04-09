# Menagerie: A Dataset of Graded CS1 Assignments
TODO - Summarise the dataset

## Using the dataset
To use the dataset for your research, the submissions source code can be found in ```data/anonymised_assignments```
and the awarded grades and feedback can be found in ```data/grades```.
These are split by academic year (18/19, 19/20, 20/21, 21/22).
Only 271 assignments have associated grades and feedback, as they are not the original awarded grades for 
the assignment, but instead annotated as part of another study (details of which can be found in [Publications](#publications)).

Some submissions fail to compile and these are either compile issues in the submission or the original submission chose
to use a library. We chose to exclude all libraries in the dataset as we could guarantee that we could maintain the libraries.
For a list of the submissions that do not compile see `data/exceptions.txt` and `data/library_exceptions.txt`.

An example analysis of the source code can be found in [Example Analysis](#example-analysis).
More in-depth examples of the using the dataset can be found in the [publications](#publications) data processing repositories.

## Example Analysis
TODO:
- Explain the example analysis directory


## Publications
TODO:
- Add Consistency in Grading Paper
- Add AIED Journal Extension

## Structure
```
.
├── data
│   ├── anonymised_assignments
│   │   ├── 18~19.zip
│   │   ├── 19~20.zip
│   │   ├── 20~21.zip
│   │   └── 21~22.zip
│   ├── batches
│   ├── exceptions.txt
│   ├── known_exceptions.txt
│   ├── library_exceptions.txt
│   ├── template
│   │   ├── 18~19
│   │   ├── 19~20
│   │   ├── 20~21
│   │   └── 21~22
├── example_analysis
│   ├── analysis.ipynb
│   ├── data_loader.ipynb
│   └── plots
├── processors
│   ├── batch_processor.ipynb
│   ├── branch_processor.ipynb
│   ├── clear_class.sh
│   ├── compile_processor.sh
│   ├── gradescope_processor.ipynb
│   ├── merge_request_processor.ipynb
│   ├── post_processor.ipynb
│   ├── submission_processor.ipynb
│   ├── submission_zip_processor.ipynb
│   └── template_processor.ipynb
└── requirements.txt
```

## Data Processing Pipeline
### Requirements
#### Python Libraries:
- GitPython
- pandas
- seaborn
- pydub
- selenium
- tqdm
#### External Libraries:
- ffmpeg

## Processing Identifiable Assignments

## Generating and Uploading Batches For Grading

## Citation
If you use this dataset in your work please cite: (or should this be the AIED journal paper?)
```
@misc{Messer2024,
  title={Meneragie: A Dataset of Graded Programming Assignments},
  url={osf.io/q8jbt},
  publisher={OSF},
  author={Messer, Marcus and Brown, Neil and Kölling, Michael and Shi, Miaojing},
  year={2024},
  month={Apr}
}
```