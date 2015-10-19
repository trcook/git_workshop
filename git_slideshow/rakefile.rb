require "rake/clean"
require 'yaml'
# Install yaml and hincludes if not present


if not FileList.glob("rakeconfig.yaml").empty?
$config=YAML.load_file("./rakeconfig.yaml")
else
  warn("error, rakeconfig.yaml not found. creating it.")
YAML_NEW=<<EOS

excludes: ['.*readme.*','.*pandoc.*','.*README.*']
header_includes_file: 'header_includes.hincludes'
template: 'class_presentation.latex'
EOS
  IO.write("rakeconfig.yaml",YAML_NEW)
  $config=YAML.load_file("./rakeconfig.yaml")
end

if FileList.glob($config['header_includes_file'].to_s).empty?
  IO.write($config['header_includes_file'].to_s,%{%put includes here})
end

####

task :default =>["installrmd","installmd","clobber"]

task :clobber do
  puts CLEAN
end



$clean_str1 = Regexp.new("(.*\.(snm|out\.ps|nav|vrb|run\.xml|bcf|tmp|blg|toc|log|aux|bbl|fls|fdb_latexmk|synctex.gz))")
$clean_str2=Regexp.new("(.*(blx.bib))")






SCRIPT_TO_RUN =<<EOS
Rscript -e 'require(knitr);options("revealout"="n");render_markdown();opts_chunk$set(dev = "pdf",fig.ext="pdf",eval=TRUE,echo=FALSE,message=FALSE,warning=FALSE,error=FALSE);knit("@input_file", output="@output_file")'
EOS

KNIT_TO_RUN =<<EOS
pandoc "@input_file" "rakeconfig.yaml" --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash-implicit_figures  -t beamer --slide-level=2  -o "@output_file" -V theme:Amsterdam -s --biblatex --bibliography="/s/dissandprojects.bib" --template=class_presentation.beamer  --toc --include-in-header=#{$config['header_includes_file']}
EOS

KNIT_TO_RUN =<<EOS
pandoc "@input_file" "rakeconfig.yaml" --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash-implicit_figures  -t beamer --slide-level=2  -o "@output_file" -V theme:Amsterdam -s   --template=class_presentation.beamer   --include-in-header=#{$config['header_includes_file']} 
EOS

my_rmd_files=FileList[Dir.glob("./*.rmd", File::FNM_CASEFOLD)]
my_md_files=FileList[Dir.glob("./*.md", File::FNM_CASEFOLD)]
my_md_files= my_md_files - my_rmd_files.ext("md")

#: this needs to exclude pandoc extensions. this is crucial.

# out_file=my_rmd_files.pathmap("%n.pdf")
# out_file.add(my_md_files.pathmap("%n.pdf"))
task :installrmd
task :installmd

task :installrmd=>my_rmd_files.ext("pdf")

task :installmd=>my_md_files.ext("pdf")

namespace :installrmd do
  rule ".pdf" =>".rmd" do |t|
    puts "#{t.source}#{t.name}"
    proc_and_move(t,1)
    puts "clean is #{CLEAN}"
  end
end


namespace :installmd do
  file my_md_files.ext("pdf") => my_md_files
  rule ".pdf" =>".md" do |t|
    puts "#{t.source}#{t.name}"
    proc_and_move(t)
  end
end

define_method(:proc_and_move) do |t,*args|
  unless args.empty?
  system %{
  #{SCRIPT_TO_RUN.sub("@input_file",t.source).sub("@output_file",t.name.ext(".md"))}
  }
  end
  system %{
  #{KNIT_TO_RUN.sub("@input_file",t.name.ext("md")).sub("@output_file",t.name.ext(".tex"))}
  }


  # need to use error handling block here because sometimes biber throws error if run in latexmk
  begin
    sh %Q{latexmk -f -pdf "#{t.name.ext("tex")}"}

  rescue
    error_string= "proceeding despite errors"
    puts error_string
  else


  end
  CLEAN.include(FileList[Dir.glob("*").find_all { |j| $clean_str1=~j }])
  # noinspection RubyResolve
  CLEAN.include(FileList[Dir.glob("*").find_all { |j| $clean_str2 =~j }])
  CLEAN.include(FileList[t.name.ext(".tex")])
  return
end

### end new
