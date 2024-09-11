#!/usr/bin/env texlua
 
module="zugferd"

sourcefiles={"*.dtx","*.ins", "*.sty"}

demofiles={"*.tex"}
typesetdemofiles={"*.tex"}

typesetexe="lualatex"

tagfiles = {"*.dtx","*.sty", "*.md", "*.tex"}
function update_tag(file, content, tagname, tagdate)
	if string.match(file, "%.md$") or string.match(file, "%.tex$") then
		content = string.gsub(content,
			"([Vv]ersion%s)%d+%.%d+%s%(%d%d%d%d%-%d%d%-%d%d%)",
			"%1"..tagname.." ("..tagdate..")")
	else
		content = string.gsub(content,
			"(\\Provides%a-{[^\n]-}%[)%d%d%d%d%-%d%d%-%d%d%s-v%d-%.%d+",
			"%1"..tagdate.." v"..tagname)
		content = string.gsub(content,
			"(\\ProvidesExpl%a-{[^\n]-}){[^\n]-}{[^\n]-}",
			"%1{".. tagdate.."}{"..tagname .. "}")
		content = string.gsub(content,
			"(\\usepackage{"..module.."}%[)%d%d%d%d%-%d%d%-%d%d%]",
			"%1"..tagdate.."]")
		content = string.gsub(content,"\\changes{v"..tagname.."}{%d%d%d%d/%d%d/%d%d", "\\changes{v"..tagname.."}{"..tagdate)
	end
	return content
end
