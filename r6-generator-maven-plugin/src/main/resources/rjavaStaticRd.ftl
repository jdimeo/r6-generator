% Generated by r6-generator-maven-plugin: do not edit by hand

\name{${method.getSnakeCaseName()}}
\alias{${method.getSnakeCaseName()}}
\title{${method.rdEscape(method.getTitle())}}
<#if !method.getParameterNames()?has_content>
\usage{${method.getSnakeCaseName()}()
<#else>
\usage{${method.getSnakeCaseName()}(
	${method.getFunctionParameterCsv(",\n\t")}
)
</#if>
}
<#if method.getParameterNames()?has_content>
\arguments{
	\if{html}{\out{<div class="arguments">}}
	<#list method.getParameterNames() as paramName>
	\item{${paramName}}{${method.getParameterDescription(paramName)} - (java expects a ${method.getParameterType(paramName).getSimpleName()})}
	</#list>
	\if{html}{\out{</div>}}
}
</#if>
\value{
<#if method.isFactory()>
R6 ${method.getReturnType().getSimpleName()} object: ${method.getAnnotationValue("return")!}
<#else>
${method.getReturnType().getSimpleName()}: ${method.getAnnotationValue("return")!}
</#if>
}
\description{
${method.rdEscape(method.getNonTitleDescription())!}
}
<#if method.hasExamples()>
\examples{\dontrun{
<#list method.getAnnotationList("examples") as example>
${method.rdEscapeExample(example)}
</#list>
}
}
</#if>
\keyword{java api}


