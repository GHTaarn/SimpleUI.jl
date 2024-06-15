# Contributing

## Bug reports and feature requests

Submit these to https://github.com/GHTaarn/SimpleUI.jl/issues

## Pull requests

I have limited time to develop this application, so good code contributions are welcome.
For pull requests, please have the following in mind:

 - Use Julia naming conventions
 - Indent with 4 spaces
 - Use good programming practices
 - Document exported symbols with docstrings
 - Try to use the existing style, even if it is not entirely your taste
 - If you make something that looks stupid at first glance, please explain it with a comment so that people are not tempted to tidy it in an incorrect way (if you make something that looks stupid and is stupid, please tidy it before submitting the pull request (unless it is meant as a mockup))
 - At present, the project has no tests, but you are welcome to submit tests

## For developers with write permission to the SimpleUI.jl Github repository:

 - Branches are named as in the Julia git repository:
      - master : New feature development. All tests should pass. Version should be x.x.0-DEV
      - release-x.x : A stable release for each minor version, all tests should pass. Unlike the Julia repository, do not commit anything here unless it is verified release ready and has version x.x.x
 - Release procedure for x.x.0 releases:
   1. Inform everyone with write permission that you are starting the release procedure
   2. Run unit tests
   3. Read through README.md and try out all code examples to verify that they work
   4. Instruct everyone with write permission to hold off commits to master until you give the green light & check that your master is up to date
   5. Edit Project.toml changing version to x.x.0
   6. Create the branch release-x.x
   7. On the master branch, edit Project.toml and bump up its version to x.x.0-DEV (where the minor version is increased by one, or major version is increased by one and minor version is set to zero)
   8. Push master and the new branch to Github
   9. Inform everyone with write permission that it is safe to commit to master
   10. Switch to the new release branch and run `LocalRegistry.register()` from `julia` to register the new version
   11. On Github, create a new release, giving release-x.x the tag vx.x.0

The commandline part of the above can be summarised as:

```bash
# PWD should be the project home directory directory
git switch master
vi Project.toml # Set version to x.y.0
git add Project.toml
git commit -m "Increased version to x.y.0"
git branch release-x.y
vi Project.toml # Set version to X.Y.0-DEV (where either X=x+1 and Y=0 or X=x and Y=y+1)
git add Project.toml
git commit -m "Increased version to X.Y.0-DEV"
git push
git switch release-x.y
git push --set-upstream origin release-x.y
#To set up, something like: julia -e 'using Pkg; pkg"registry add https://github.com/GHTaarn/FreeRegistry"'
julia -e "using LocalRegistry; register()"
```

Visit https://github.com/GHTaarn/SimpleUI.jl/releases/new and create the new
release. Set the title to "SimpleUI.jl version x.y.0" and make sure to set the branch to `release-x.y`

