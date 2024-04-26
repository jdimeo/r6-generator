% Generated by r6-generator-maven-plugin: do not edit by hand

\name{${class.getSimpleName()}}

\alias{${class.getSimpleName()}}
<#-- \alias{\S4method{new}{${class.getSimpleName()}}} -->

\title{${class.getTitle()}}

<#-- 
\usage{
<#assign method=class.getConstructor()>
\S4method{new}{${class.getSimpleName()}}(${method.getParameterCsv()})
}
 -->
<#assign constr=class.getConstructor()>
<#if constr.getParameterNames()?has_content>
\arguments{
	\if{html}{\out{<div class="arguments">}}
	<#list constr.getParameterNames() as paramName>
	\item{${paramName}}{${constr.getParameterDescription(paramName)} - (java expects a ${constr.getParameterType(paramName).getSimpleName()})}
	</#list>
	\if{html}{\out{</div>}}
}
</#if>


\description{
${class.getDescription()!}

Version: ${model.getConfig().getVersion()}

Generated: ${model.getConfig().getDate()}
}

\details{
	${class.getDetails()!}
}

\examples{
## -----------------------------------
## Construct new instance of ${class.getSimpleName()}
## -----------------------------------
<#if constr.hasExamples()>
	<#if class.hasExampleSetup()>
		<#list class.getExampleSetup() as exampleSetup>
${constr.rdEscapeExample(exampleSetup)}
		</#list>
	</#if>
	<#list constr.getExamples() as example>
${constr.rdEscapeExample(example)}
	</#list>
<#else>
\dontrun{
J = ${model.getConfig().getPackageName()}::JavaApi$get()
# appropriate parameter values must be provided
instance = J$${class.getSimpleName()}$new(${constr.getParameterCsv()})
}
</#if>
<#list class.getInstanceMethods() as method>

## -----------------------------------
## Method `${class.getSimpleName()}$${method.getName()}(${method.getParameterCsv()})`
## -----------------------------------
	<#if method.hasExamples()>
		<#if class.hasExampleSetup()>
			<#list class.getExampleSetup() as exampleSetup>
${method.rdEscapeExample(exampleSetup)}
			</#list>
		</#if>
		<#list method.getExamples() as example>
${method.rdEscapeExample(example)}
		</#list>
	<#else>
\dontrun{
# appropriate parameter values must be provided
instance$${method.getName()}(${method.getParameterCsv()})
}
	</#if>
</#list>
}

\keyword{java api}

\section{Methods}{
	\subsection{Constructors}{
		\itemize{
<#assign method=class.getConstructor()>
			\item \href{#method-${method.getName()}}{\code{J$${class.getSimpleName()}$${method.getName()}(${method.getParameterCsv()})}}
		}
	}
	\subsection{Class methods}{
		\itemize{
<#if !class.getInstanceMethods()?has_content>
			\item none
<#else>
	<#list class.getInstanceMethods() as method>
			\item \href{#method-${method.getName()}}{\code{instance$${method.getName()}(${method.getParameterCsv()})}}
	</#list>
</#if>
			\item \code{instance$clone()}
			\item \code{instance$print()}
		}
	}

	\if{html}{\out{<hr>}}
	\if{html}{\out{<a id="method-${constr.getName()}"></a>}}
	
	\subsection{Constructor \code{${constr.getName()}()}}{
${method.getDescription()}

		\subsection{Usage}{
			\if{html}{\out{<div class="r">}}
			\preformatted{
J = ${model.getConfig().getPackageName()}::JavaApi$get()
instance = J$${class.getSimpleName()}$new(${constr.getParameterCsv()});
  			}
			\if{html}{\out{</div>}}
		}
	
		\subsection{Arguments}{
			\if{html}{\out{<div class="arguments">}}
	<#if !constr.getParameterNames()?has_content>
			\itemize{
				\item none
	<#else>
			\describe{
		<#list constr.getParameterNames() as paramName>
				\item{${constr.getParameterDescription(paramName)}}{ - (java expects a ${constr.getParameterType(paramName).getSimpleName()})}
		</#list>
	</#if>
			}
			\if{html}{\out{</div>}}
		}

		\subsection{Returns}{
the new R6 ${class.getSimpleName()} object
		}

	<#if constr.hasExamples()>
		\subsection{Examples}{
			\if{html}{\out{<div class="r example copy">}}
			\preformatted{
		<#if class.hasExampleSetup()>
			<#list class.getExampleSetup() as exampleSetup>
${method.rdEscapeExample(exampleSetup)}
			</#list>
		</#if>
		<#list constr.getExamples() as example>
${method.rdEscapeExample(example)}
		</#list>
			}
			\if{html}{\out{</div>}}
		}
	</#if>	
	}

<#list class.getInstanceMethods() as method>
	\if{html}{\out{<hr>}}
	\if{html}{\out{<a id="method-${method.getName()}"></a>}}
	
	\subsection{Method \code{${method.getName()}()}}{
${method.getDescription()}

		\subsection{Usage}{
			\if{html}{\out{<div class="r">}}
			\preformatted{
J = ${model.getConfig().getPackageName()}::JavaApi$get()
instance = J$${class.getSimpleName()}$new(${constr.getParameterCsv()});
instance$${method.getName()}(${method.getParameterCsv()})
  			}
			\if{html}{\out{</div>}}
		}
	
		\subsection{Arguments}{
			\if{html}{\out{<div class="arguments">}}
	<#if !method.getParameterNames()?has_content>
			\itemize{
				\item none
	<#else>
			\describe{
		<#list method.getParameterNames() as paramName>
				\item{${method.getParameterDescription(paramName)}}{ - (java expects a ${method.getParameterType(paramName).getSimpleName()})}
		</#list>
	</#if>
			}
			\if{html}{\out{</div>}}
		}

		\subsection{Returns}{
	<#if method.isFactory()>
R6 ${method.getReturnType().getSimpleName()} object: ${method.getAnnotationValue("return")!}
	<#else>
${method.getReturnType().getSimpleName()}: ${method.getAnnotationValue("return")!}
	</#if>
		}

	<#if method.hasExamples()>
		\subsection{Examples}{
			\if{html}{\out{<div class="r example copy">}}
			\preformatted{
		<#if class.hasExampleSetup()>
			<#list class.getExampleSetup() as exampleSetup>
${method.rdEscapeExample(exampleSetup)}
			</#list>
		</#if>
		<#list method.getExamples() as example>
${method.rdEscapeExample(example)}
		</#list>
			}
			\if{html}{\out{</div>}}
		}
	</#if>
	}
</#list>
}