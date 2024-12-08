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

-- allow to tag the build.lua file
if options["target"] == "tag" then
	excludefiles={"*~"}
end

packageversion = "0.9c"
packagedate      = "2024-12-08"

sourcefiles={"*.dtx","*.ins", "*.sty"}
demofiles={"*.tex"}

-- demofiles should be typeset for testing but not for the ctan upload
if options["target"] ~= "ctan" then
	typesetdemofiles={"*.tex"}
end

typesetexe="lualatex"
typesetopts=""

supportdir="support"
checksuppfiles={"validate_zugferd.sh","Mustang-CLI.jar","zugferd-test.ltx"}

checkconfigs = {"build"}
-- checkconfigs = {"build", "config-pdf"} -- pdf config is only checked on release

ctanreadme="README_CTAN.md"

tagfiles = {"*.dtx","*.sty", "*.md", "*.tex","*.lua"}
function update_tag(file, content, tagname, tagdate)
	local versionpattern = "%d+.%d+%-?%w*"
	local datepattern = "%d%d%d%d%-%d%d%-%d%d"
	if string.match(file, "%.md$") or string.match(file, "%.tex$") then
		content = string.gsub(content,
			"([Vv]ersion%s)"..versionpattern.."%s%("..datepattern.."%)",
			"%1"..tagname.." ("..tagdate..")")
	elseif file == "build.lua" then
		content = string.gsub(content,"(packageversion%s*=%s*\")"..versionpattern, "%1"..tagname)
		content = string.gsub(content,"(packagedate%s*=%s*\")"..datepattern, "%1"..tagdate)
	else
		content = string.gsub(content,
			"(\\Provides%a-{[^\n]-}%[)"..datepattern.."%s-v"..versionpattern,
			"%1"..tagdate.." v"..tagname)
		content = string.gsub(content,
			"(\\ProvidesExpl%a-{[^\n]-}){[^\n]-}{[^\n]-}",
			"%1{".. tagdate.."}{"..tagname .. "}")
		content = string.gsub(content,
			"(\\usepackage{"..module.."}%[)"..datepattern.."%]",
			"%1"..tagdate.."]")
		content = string.gsub(content,"\\changes{v"..tagname.."}{"..datepattern, "\\changes{v"..tagname.."}{"..tagdate)
		content = string.gsub(content,"\\changes{v?0*%.0*}{"..datepattern, "\\changes{v"..tagname.."}{"..tagdate)
		content = string.gsub(content,"\\changes{version}{date", "\\changes{v"..tagname.."}{"..tagdate)
	end
	return content
end

github_base_url="https://github.com/TeXhackse/LaTeX-ZUGFeRD"
gitlab_base_url="https://gitlab.com/islandoftex/texmf/"..module

ctanpkg=module
uploadconfig = {
    author = "Marei Peischl",
    uploader = "Marei Peischl",
    description="This package provides interfaces to allow creating ZUGFeRD or Faktur-X invoices with LaTeX including the XML file. It can be used to modify personal invoicing templates to fulfil the requirements for digital invoicing without further modification of the invoicing processes.",
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
		if run == checkruns and options["target"] == "save" and name ~= "lostchars" then
			return "./validate_zugferd.sh " .. name
		else
			return ""
		end
end
