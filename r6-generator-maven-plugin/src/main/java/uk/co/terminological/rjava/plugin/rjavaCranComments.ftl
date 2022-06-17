# Generated by r6-generator-maven-plugin: remove this line and make manual changes when you come to CRAN submission

## Test environments

# N.B. this is only true is you have uncommented the correct lines in github actions workflow files
(via GitHub actions)
* ubuntu-latest; R-release 
* windows-latest, oldrel-1
* windows-latest, release
* windows-latest, devel
* macOS-latest, oldrel-1
* macOS-latest, release
* macOS-latest, devel
* ubuntu-latest, oldrel-1
* ubuntu-latest, devel

## R CMD check results
# TODO: insert R CMD check results here before submission

<#if !model.getConfig().preCompileBinary()>
## CRAN warnings justifications
 
`mvnw`, `mvnw.cmd`, `pom.xml` and the `.mvn` subdirectory are required to allow compilation of java files from source, 
which is needed if the pre-compiled JAR files are >5Mb and too big to submit to CRAN. In this case the use of maven wrapper 
scripts and maven `pom.xml` allows the most portable Java build experience.
</#if>

## CRAN notes justifications
  
<#if model.getConfig().preCompileBinary()>
* This library includes a precompiled java binary file. This often will exceed the 5Mb CRAN limits. Unfortunately the 
alternative of building the library from source code causes a `R CMD check` warning due to inclusion of dependency management
configuration `pom.xml` files. 
</#if>
* R6 is a build time dependency so appears unused when it is in fact not.
* This is a new release.
