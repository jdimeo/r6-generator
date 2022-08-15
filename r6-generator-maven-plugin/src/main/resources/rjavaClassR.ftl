# Generated by r6-generator-maven-plugin: do not edit by hand
# Contact: ${model.getConfig().getMaintainerEmail()}
# ${model.getConfig().getTitle()}
#' R6 Bindings for Java ${class.getSimpleName()}
#'
#' @description
#' ${class.getDescription()!}
#' 
#' This is a class of the ${model.getConfig().getPackageName()} generated R library.
#' 
#' Version: ${model.getConfig().getVersion()}
#' 
#' Generated: ${model.getConfig().getDate()}
#'
#' @details
${class.doxygen(class.getDetails())!}
#' @export
${class.getSimpleName()} = R6::R6Class("${class.getSimpleName()}", public=list(

	#' @field .api internal pointer to the library object.
	.api = NULL,

	#' @field .jobj internal pointer to the rJava reference to the java object.
	.jobj = NULL,

	<#-- .ptr = NULL, -->

	#' @description
	#' Create a new ${class.getSimpleName()} this is not for general use and instances should be created through the
	#' package api class. See example.
	#' @param jobj The internal rJava reference.
	#' @param api The R6 api library class.
	#' @return A new ${class.getSimpleName()} object.
	<#assign method=class.getConstructor()>
	#' @examples
	#' \dontrun{
	#' J = ${model.getConfig().getPackageName()}::JavaApi$get()
	#' # This constructor must be called via the JavaApi where an appropriate set of parameters must be provided.
	#' instance = J$${class.getSimpleName()}$${method.getName()}(${method.getFunctionParameterCsv()})
	#' }	
	initialize = function(jobj,api){
		self$.jobj = jobj;
		self$.api = api;
		<#-- 
		self$.ptr = xptr::xptr_address(jobj@jobj)
		api$register(self)
		 -->
	},
	
	<#list class.getInstanceMethods() as method>
	#' @description 
${method.doxygen(method.getName())}: 
${method.doxygen(method.getDescription())}
		<#list method.getParameterNames() as param>
${method.doxygen("param",method.getParameterDescription(param))} - (java expects a ${method.getParameterType(param).getSimpleName()})
		</#list>
		<#if method.isFactory()>
	#' @return R6 ${method.getReturnType().getSimpleName()} object: 
${method.doxygen(method.getAnnotationValue("return"))!}
		<#else>
	#' @return ${method.getReturnType().getSimpleName()}: 
${method.doxygen(method.getAnnotationValue("return"))!}
		</#if>
		<#if method.hasExamples()>
	#' @examples
			<#if class.hasExampleSetup()>
				<#list class.getExampleSetup() as exampleSetup>
${method.doxygen(exampleSetup)}
				</#list>
			</#if>	
			<#list method.getExamples() as example>
${method.doxygen(example)}
			</#list>
		</#if>
	${method.getName()} = function(${method.getFunctionParameterCsv()}) {
		# copy parameters
		<#list method.getParameterNames() as param>
		tmp_${param} = self$.api$.toJava$${method.getParameterType(param).getSimpleName()}(${param});
		</#list>
		# execute method call
		tmp_out = .jcall(self$.jobj, returnSig = "${method.getReturnType().getJNIType()}", method="${method.getName()}" ${method.getParameterCsv("tmp_")}, check=FALSE);
		self$.api$printMessages()
		# check for exceptions and rethrow them
		.jcheck()
		<#if method.isFactory()>
		# is this a fluent method?
		# if(.jcall(self$.jobj, returnSig="Z", method="equals", .jcast(tmp_out))) {
		if(self$.jobj$equals(tmp_out)) {
			# return fluent method
			invisible(self)
		} else {
			# wrap return java object in R6 class  
			out = ${method.getReturnType().getSimpleName()}$new(
				self$.api$.fromJava$${method.getReturnType().getSimpleName()}(tmp_out),
				self$.api
			);
			return(out);
		}
		<#else>
		# convert java object back to R
		out = self$.api$.fromJava$${method.getReturnType().getSimpleName()}(tmp_out);
		if(is.null(out)) return(invisible(out))
		return(out);
		</#if>
	},
	</#list>
	
	#' @description The output of toString() of this ${class.getSimpleName()}
	print = function() {
		tmp_out = .jcall(self$.jobj, returnSig = "Ljava/lang/String;", method="toString");
		self$.api$printMessages()
		print(tmp_out)
		invisible(self)
	},
	
	#' @description The output of equals() of this ${class.getSimpleName()}
	#' @param object The R6 instance to test for equality to this ${class.getSimpleName()}  
	equals = function(object) {
		if (is.null(object$.jobj)) return(FALSE)
		return(self$.jobj$equals(object$.jobj))
	},
	
	#' @description Allow this object to be garbage collected.
	finalize = function() {
		<#if class.hasFinalizer()>
		if(!is.null(self$.jobj)) {
			.jcall(self$.jobj, returnSig = "V", method="${class.getFinalizer()}", check=FALSE)
			e = .jgetEx(clear=TRUE)
			if (!is.null(e)) {
				self$.api$.log$error(e$getMessage())
			}
			self$.api$printMessages() 
		}
		</#if>
		self$.jobj = .jnull("${class.getJNIName()}")
		self$.jobj = NULL
		.jgc(R.gc = FALSE)
	}
))
