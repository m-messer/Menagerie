# Menagerie: A Dataset of Graded CS1 Assignments
The Menagerie dataset consists of a second semester CS1 assignment that ran over four academic years (18/19 - 21/22).
It consists of 667 total submissions, with 272 of those being subsequently graded _post hoc_ 
as part of a study into the consistency of human graders.
We ask that if you use Menagerie in your research to use the [citation](#citation) below.

## Assignment Specification
For the complete assignment specification and template code see ```data/template```.
The assignment was a small-group, open-ended paired programming assignment to utilise object-oriented programming concepts to develop a predator/prey simulator with groups of two or three.
The students were provided with a template project based on the "foxes-and-rabbit" from "Objects First with Java" by Barnes and Kölling 2006.
The template includes a graphical user interface (GUI), a field class which contains a two-dimensional array for the simulation environment, and two animals, a Fox and a Rabbit.
Students were asked to extend the template code with the following base tasks:
- The simulation should have at least five species, with at least two being predators and at least two not being predators.
- At least two predators should compete for the same food source.
- Some or all species should distinguish between male and female animals and can only propagate when male and female species are in a neighbouring cell of the two-dimensional array.
- The simulation should keep track of the time of the day, and some species should exhibit different behaviours at some time of the day.

After completing the base tasks, the students were asked to implement one or more challenge tasks.
The students could choose to invent their own tasks or to use one or more of the following suggestions:
- Simulate the lifecycle of plants, including growth and being a food source for at least one animal.
- Simulate changing weather states and how they affect other simulation aspects.
- Simulate disease within the species, including the spread of the disease.

## Assignment Source Code Submissions
The source code submissions source code can be found in ```data/anonymised_assignments```.
These are split by academic year (18/19, 19/20, 20/21, 21/22).

Some submissions fail to compile and these are either compile issues in the submission or the original submission chose
to use a library. We chose to exclude all libraries in the dataset as we could guarantee that we could maintain the libraries.
For a list of the submissions that do not compile see `data/exceptions.txt` and `data/library_exceptions.txt`.

We have conducted some sample analysis of the submitted source code, including the total classes, the lines of code, and use of interation.
The example of how we load the Java files into a Pandas Dataframe can be found in ```example_analysis/data_loader.ipynb```,
and the analysis code can be found in ```example_analysis/analysis.ipynb```.

More in-depth examples of the using the dataset can be found in the [publications](#publications) data processing repositories.

## Assignment Grades
The awarded grades and feedback can be found in ```data/grades.csv```.
Only 273 assignments have associated grades and feedback, as they are not the original awarded grades for
the assignment, but instead annotated as part of another study (details of which can be found in [Publications](#publications)).
All 273 assignments have each been graded four times on correctness, code elegance, readability and documentation, as described below.
To find a single grade for the assignment for each of the skills, we suggest that researchers may take the consensus grade or the average grade.

The grades and feedback published in the Menagerie dataset are not the students' awarded grades, as we could not receive ethical permission to release actual student grades publicly.
Details about how we captured these grades can be found in our [publications](#publications).

The assignments were graded on correctness, code elegance, readability, and documentation.
Correctness covered how well the students met the assignment requirements.
Code elegance focuses on writing maintainable code, including correctly using functions and classes.
Readability covers how readable the source code is, including whether the students used meaningful variable and function names and used whitespace to separate code blocks.
Documentation examines if the associated documentation is well written and organised and clearly explains what the code is accomplishing.

The graders were asked to provide individual letter grades for correctness, code elegance, readability, and documentation instead of an overall grade for the entire assignment to provide more fine-grained details on their grading.
The letter grades consisted of grades from A++ to F, with + and - grades available for all but F.
They were also asked to give feedback on their graded submissions, either as feedback on the overall assignment or individual lines of code.

For more information about the graders' demographics, see ```demographics_analysis.ipynb```.

## Publications
We have used the Menagerie dataset in a number of publications, including evaluating the consistency of human graders and
developing machine learning-based automatic assessment tools for grading documentation.
For further details please see the papers and data processing repositories below:

- How Consistent Are Humans When Grading Programming Assignments?: 2024. osf.io/preprints/edarxiv/nd6qy.

## Citation
If you use this dataset in your work please cite:
```
@misc{messer2025consistenthumansgradingprogramming,
      title={How Consistent Are Humans When Grading Programming Assignments?}, 
      author={Marcus Messer and Neil C. C. Brown and Michael Kölling and Miaojing Shi},
      year={2025},
      eprint={2409.12967},
      archivePrefix={arXiv},
      primaryClass={cs.CY},
      url={https://arxiv.org/abs/2409.12967}, 
}
```

## Data Processing Pipeline
All our data processing can be found in ```assignment_processors/*```.

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

### Processing Identifiable Assignments
The following steps are how we process identifiable assignments into the anonymized assignments that make up this dataset.

1. Generate hashes, remove duplicates, extract compressed files, remove not needed files and remove ```@author``` tags.
   See ```submission_processor.ipynb```.
2. Clean up the template code so it is in the same state as the submissions, see ```template_processor.ipynb```.
3. Generate branches and merge requests based on the template code and the submission on a local GitLab instance. 
   Allowing for research assistants an easy way to view the differences and remove any identifiable information.
   See ```branch_processor.ipynb``` and ```merge_request_processor.ipynb```.
4. Get the anonymised submissions and remove the images, video and audio from the submissions (as these cannot easily be anonymised).
   See ```post_processor.ipynb```.
5. Compile and log any exceptions, then clear the generated `.class` files. See ```compile_processor.sh``` and ```clear_class.sh```.

### Generating and Uploading Batches For Grading
To facilitate the consistency in grading study, we generated batches for grading and uploaded them to Gradescope, a commercial grading platform.
```batches_processor.ipynb``` randomly samples the assignments without repeats (each batch is saved to a central list),
and ```gradescope_processor.ipynb``` handles automatically uploading the assignments to Gradescope.
The course and assignment creation, and uploading of the rosters has to be completed manually.
