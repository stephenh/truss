

* Most HTML templates are boilerplate spaghetti code with no levels of abstraction
* Kind of like [Tapestry][2]/[Click][3] (component-based pages)

[2]: http://tapestry.apache.org/
[3]: http://incubator.apache.org/click/

* [truss](web.html) (via [bindgen](bindgen.html)) uses "design time" code generation ran automatically by the IDE

Why Design Time
---------------

truss's code generation is well suited to design-time code generation because it:

* Uses quickly changing meta-data, the source code, so needs to run continuously
* Uses codebase meta-data from the APT API, so has very little gathering cost

