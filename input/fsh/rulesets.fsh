RuleSet: Question(linkId, text, type, required)
* item[+].linkId = "{linkId}"
* item[=].text = "{text}"
* item[=].type = #{type}
* item[=].required = {required}


RuleSet: AddQRVariable(QRitem)
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "{QRitem}Value"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%questionnaire.item.where(linkId = '{QRitem}').answerOption.where(valueCoding.code=%resource.item.where(linkId = '{QRitem}').answer.valueCoding.code).extension.where(url=%scoreExt).valueDecimal"


//* item[=].answerOption[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix"read
//* item[=].answerOption[=].extension[=].valueString = "0"


RuleSet: ValuedAnswerOption(code, display, value)
* answerOption[+].valueCoding = #{code} "{display}"
* answerOption[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* answerOption[=].extension[=].valueDecimal = {value}
//* item[=].answerOption[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix"
//* item[=].answerOption[=].extension[=].valueString = "0"

