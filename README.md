# Docker for Bayesian Logic Programming (BLOG)

# Purpose
To provide Docker for Bayesian Logic Programming (BLOG)

# Resources
1. [BLOG Programming](https://bayesianlogic.github.io/pages/download.html)
2. [Run Examples](https://bayesianlogic.github.io/pages/get-started.html)

# Run (Editor with Sublime_Text3)
To run the simple example build image; it will pop up Sublime_Text(v3) GUI Editor with default "burglary.blog".
```
./run.sh
```

## Compile BLOG programming 
Select DropDown menu "Tools" --> "Build" (it will automatic invoke BLOG interpreter and 
display results in Conlse windows below the Sublime_Text GUI Editor.

## Command line BLOG try "burglary.blog"
You can try run the "butglary.blog" 
```
./try-burglary.sh
```
# (Optional) Build - if you want to build local image!

```
./build.sh
```

# Issues
Sublime latest version requiring the installation of big package GTK 2.0 or 3.0. Hence, the image will be much larger!

