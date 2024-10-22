#!/usr/bin/env texlua

--[[
	Build script for the LaTeX-ZUGFeRD project
	Copyright (C) 2024 Marei Peischl <marei@peitex.de>

	This file is part of the build system of the zugferd package.

	It may be distributed and/or modified under the conditions of the
	LaTeX Project Public License (LPPL), either version 1.3c of this
	license or (at your option) any later version. The latest version
	of this license is in the file

	https://www.latex-project.org/lppl.txt
]]
 
module="zugferd"
packageversion= "0.8"
packagedate   = "2024-09-11"

sourcefiles={"*.dtx","*.ins", "*.sty"}
demofiles={"*.tex"}
typesetdemofiles={"*.tex"}

typesetexe="lualatex"
typesetopts=""

supportdir="support"
checksuppfiles={"validate_zugferd.sh","Mustang-CLI.jar"}

ctanreadme="README_CTAN.md"

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

github_base_url="https://github.com/TeXhackse/LaTeX-ZUGFeRD"
gitlab_base_url="https://gitlab.com/islandoftex/texmf/"..module

ctanpkg=module
uploadconfig = {
    author = "Marei Peischl",
    uploader = "Marei Peischl",
    description="Create ZUGFeRD, X-Rechnung or Faktur-X invoices with LaTeX",
    pkg = ctanpkg,
    version = packageversion .. " " .. packagedate,
    license = "lppl1.3c",
    summary = "ZUGFeRD and Faktur-X invoicing using LaTeX",
    ctanPath = "/macros/latex/contrib/" .. ctanpkg,
    repository = {gitlab_base_url..".git",github_base_url..".git"},
    bugtracker = {gitlab_base_url.."/issues",github_base_url.."/issues"},
    support = {gitlab_base_url.."/issues",github_base_url.."/issues"},
    announcement_file = "ctan.ann",
    update = true,
    topic   = "invoice",
    note_file = "ctan.note"
}

function runtest_tasks ( name , run )
		if options["target"] == "save" then
			return "./validate_zugferd.sh " .. name
		else
			return ""
		end
end
