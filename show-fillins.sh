#!/bin/bash

function unzip_document() {
  if ! [ -e "$1" ]; then
    echo "Usage: $0 <docx_file>"
    exit 1
  fi
  unzip -px "$1" word/document.xml
}

function xml_linebreak() {
  perl -pe 's/</\n</g'
}

function xml_strip() {
  perl -pe 's/<.*?>//g'
}

function make_slim() {
  perl -ne '
    if ($text) {
      if (m/FORMCHECKBOX/) {
        print "  text $text"
      } elsif (length($text) < 30) {
        print "  section_text $text"
      } else {
        print "  text $text"
      }
      $text = undef;
    }
    if(m/^\s*[A-Z]?[0-9]*[a-z]?\./) {
      print "question\n  question_text $_";
    } elsif (s/\s*FORMCHECKBOX\s*//) {
      print qq(  label.checkbox: input(type="checkbox") $_)
    } else {
      $text = $_;
    }'
}

function xml_tab() {
  perl -ne '
    BEGIN {
      $indent = 0
    }
    if (m#^</#) {
      $indent--;
      print "  " x $indent, $_;
    } else {
      print "  " x $indent, $_;
      if (m#<.*/>#) {
      } elsif (m#<#) {
        $indent++;
      }
    }
  '
}

function text_boxes() {
  perl -pe 's/\(text box ?[0-9]?\)/\n  input.input-medium(type="text" name="TEXTBOX_${\( ++$N )}" placeholder="TEXTBOX_${\( $N )}")/g'
}

#echo -e "question\n  question_text 1 Intro stuff"
#cat word/document.xml  | xml_linebreak | perl -pe 'chomp; m/paraId/ and print "\n";' | xml_strip | grep . | grep -v DELETED | make_slim | text_boxes


unzip_document templates/real.docx | xml_linebreak | grep FILLIN_
