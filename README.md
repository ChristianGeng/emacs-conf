# emacs-conf
=======

=======

My adapation of
https://github.com/chaoflow/.emacs.d

Original README:

Be prepared for rebases.

Better take a look at:

- https://github.com/corecode/skel/tree/master/.emacs.d
- https://github.com/magnars/.emacs.d/
- https://github.com/cjohansen/.emacs.d
- https://github.com/technomancy/emacs-starter-kit
from which I take inspiration or shamelessly copy.

# Further Links
* [Emacs Manual](https://www.gnu.org/software/emacs/manual/html_node/emacs/index.html#Top)
* [imenu and icycles](https://www.emacswiki.org/emacs/ImenuMode#toc3)
* [Emacs Mode Hook for autopep](http://avilpage.com/2015/05/automatically-pep8-your-python-code.html)

- http://www.coli.uni-saarland.de/~slemaguer/emacs/main.html#org67e2b1b
- https://github.com/Schnouki
- https://github.com/tmtxt/.emacs.d/tree/master/config
- https://www.masteringemacs.org
- https://caiorss.github.io/Emacs-Elisp-Programming/Keybindings.html
- http://ergoemacs.org/emacs/emacs_find_replace.html


## org mode

* http://www.coli.uni-saarland.de/~slemaguer/emacs/main.html#org3c16bce
* http://doc.norang.ca/org-mode.html
* https://sachachua.com/blog/2013/08/emacs-how-i-organize-my-org-files/
* https://orgmode.org/worg/org-hacks.html
* https://en.wikipedia.org/wiki/Getting_Things_Done

### Capturing

* C-c c - Capturn

#### Links für Capturing Templates

* https://gist.github.com/prassee/1d0678ad1c86481176a39ccb4441c53b
* https://gist.github.com/spacebat/097f3e7469edf2eaa6a9
* https://www.reddit.com/r/emacs/comments/7zqc7b/share_your_org_capture_templates/
* Die Org-Config von ist sehr mächtig, https://github.com/sk8ingdom/.emacs.d/tree/master/. Diese habe ich assimiliert. Insbesondere die Capture-Templates sind ein sehr toller Ausgangspunkt. Der Hinweis ist auch aus dem Reddit-Post: https://www.reddit.com/r/emacs/comments/7zqc7b/share_your_org_capture_templates/




## Lisp

1. [Learn Emacs Lips the Hard Way](https://github.com/hypernumbers/learn_elisp_the_hard_way/tree/master/contents)
2. [Emacs Lisp caiorss](https://caiorss.github.io/Emacs-Elisp-Programming/Elisp_Programming.html#sec-4-2)
3. [Elisp versus Scheme Lisp keywords](https://www.cs.utexas.edu/~novak/schemevscl.html)
4. [https://github.com/hypernumbers/learn_elisp_the_hard_way/tree/master/contents](Learn Elisp the hard way)

## Helm
1. [A Package in a league of its own](https://tuhdo.github.io/helm-intro.html)
2. [helm-wiki](https://github.com/emacs-helm/helm/wiki)
3. [bloc post](http://thescratchcastle.com/posts/emacs-and-helm.html)
4. [helm-swoop](allows to edit occurrences in many files too)

## python
1. [lsp-mode](https://vxlabs.com/2018/06/08/python-language-server-with-emacs-and-lsp-mode/)
2. [red baron](https://www.reddit.com/r/emacs/comments/4oyvcn/redbaron_for_emacs_refactor_your_python_method/)
3. [python lsp server imple111mentation](https://github.com/palantir/python-language-server)


Elpy issues: https://github.com/jorgenschaefer/elpy/issues/842

###  Autopep
1. [Anleitung für pep mode hook](https://avilpage.com/2015/05/automatically-pep8-your-python-code.html)



# Code Navigation

## [etags primer](https://www.coverfire.com/archives/2004/06/24/emacs-source-code-navigation/)

* `find . -name '*.[ch]' | xargs etags`
* M-. (that’s Meta-Period) and type the name of the function
* M-* to navigate to last point

* Use helm to navigate to tags: M-x helm-etags-select

* Use projectile-regenerate-tags to generate tags before.


# Fill column indication

* start using fci-mode
* (setq fci-rule-column 100)


## Java IDE

http://www.goldsborough.me/emacs,/java/2016/02/24/22-54-16-setting_up_emacs_for_java_development/
http://www.skybert.net/emacs/java/
https://github.com/skybert/my-little-friends/blob/master/emacs/.emacs.d/tkj-java-meghanada.el
https://github.com/skybert/my-little-friends/blob/master/emacs/.emacs.d/tkj-java-meghanada.el


## Web Development

Currently used Major Modes
- mmm mode are two multi-mode enginges web mode. I have  mainly configured
- vue-mode for vue framework files
- js2-mode for javascript

### Important Minor Modes

#### emmet mode

Completion for css, js, html. Abbreviations on homepage,

https://github.com/smihica/emmet-mode

C-j

#### Company-web

Company backend for web completion https://github.com/osv/company-web
configured in setup-web-mode.el and setup-auto-complete.el

M-x company-web-html

see this for language server alternative
https://emacs.stackexchange.com/questions/55230/help-setting-up-company-mode-autocompletion-of-html-css-files


### Web Mode -> Major Mode for mainly Templates, html

Flycheck use eslint:
http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html

C-c C-f         web-mode-fold-or-unfold
C-c C-e i       web-mode-element-insert
C-c C-s         insert  snippets
M-;             comment out regions
C-c C-w         show whitespaces
C-c C-m         mark region

Selection Expansion
C-n marks current element

Tag Navigation:

Closing element : type '</' and it happens in html
similarly for templates

Type faster: emmet-mode: But web-mode has sth similar
d/ -> creates div, /s creates spna

## Vue Mode

- To be described - Using lsp is quite cool


## Web Development further  links:

- https://github.com/jerryhsieh/Emacs-config
- https://blog.onionstudio.com.tw/emacs-%E5%AF%AB-vue-js/
- https://emacs-lsp.github.io/lsp-ui/


# Misc

## Misc Links

- https://github.com/redguardtoo/emacs.d/tree/master/lisp

## TODOS

Lern use-package and stream the configurations: https://github.com/jwiegley/use-package
