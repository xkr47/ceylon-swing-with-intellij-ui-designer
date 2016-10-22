I wanted to create a Swing app in Ceylon and figured I'd give using the UI designer a shot. Here are the necessary steps to get it to work:

# Steps
## Change IDEA settings
* From the menu: File -> Settings
* Navigate to Editor / GUI designer
* Make sure "Generate GUI into:" has **Java source code** selected
* Change "Default accessibility for UI-bound fields:" is something else than "private", for example **package-private**
* Click OK to save

## Create a new Ceylon project
* From the menu: File -> New -> Project
* Choose Ceylon from the left pane
* Fast-forward the wizard to the last page and choose a project name
* Click Finish

## Create a new module "test"
* Right-click the "source" folder -> New -> Ceylon module
* Name it "test"

## Configure the module dependencies
* Open the "module.ceylon" file in the `source/test` folder
* Replace the contents with the same-named file in this gist

## Create a new GUI form
* Right-click the `source/test` folder -> New -> GUI form
* Type a name for the form: "TestForm"
* Let "Create a bound class" be selected
* Click OK

## Put some component(s) in the form
* For example drag a JButton to the middle of the form area

## Build the project (optional)
* From the menu: Build -> Make Project
* Project should have no errors

## Create a ceylon source file
* Right-click the `source/test` folder -> New -> Ceylon file/declaration
* Name: "Test"

## Write the form code for TestForm in Test.ceylon
* Replace the contents with the same-named file in this gist

## Write the main app code in main.ceylon
* Replace the contents with the same-named file in this gist

## Run the app
* Right-click the "run" of the `run()` method and choose "Run 'test.run'"

# How does it work?

IntelliJ IDEA creates a TestForm.form file with the form specification. This is only used by IntelliJ. It also creates and updates TestForm.java which contains a TestForm class that sets up the whole form. Normally in a Java project one would write the form code directly into TestForm.java, but we want to do it in Ceylon.. So we create a Test.ceylon and there create a second class `Test` which extends the generated `TestForm`. Thanks to changing the accessibility setting to "package-private" our `Test` ceylon subclass can see the fields of the `TestForm` java class as normal. So then we can just use the `Test` ceylon class in place of `TestForm`.

The generated TestForm.java typically depends on some intellij classes, which normally get added to the classpath of the java project, but in ceylon we need to add a dependency to the `forms_rt` maven module. One line in module.ceylon does it.

Normally also the intellij compiler produces the gui-creating code directly into the bytecode of the TestForm class. Those class files do not get used by ceylon though, Ceylon compiles the class files independently I am told, so the bytecode gets lost. That's why we needed to configure the designer to output the code into the java code instead, so ceylon sees it.
