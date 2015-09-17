# FreeAgent CSS utilities
These CSS utilities are our ‘one true source’ of design properties at FreeAgent, comprising:

* Universal scales and aliases for: `font-size`, `font-family`, `line-height`, `color`, `background-color`, `margin`, `padding`, `border-radius`, and more
* Library of colours for text and block-level elements
* Mixins and `.u-` utility classes for 40+ CSS properties

This means our properties are managed and versioned in a single place, and we have a universal language for using them across our projects and platforms.

[Guidance on writing HTML & CSS](https://github.com/fac/fa-origin/wiki)

### Install

The utilities aren't a standalone project by themselves, but rather are to be installed in other projects. There are two ways to do so:

* [Install using NPM](https://www.npmjs.com/package/fa-css-utilities)
* [Install using Bower](http://bower.io/#install-packages)

Our starting point for new web projects at FreeAgent is [FA Origin](https://github.com/fac/fa-origin#installation), of which `fa-css-utilities` is a dependency.

### Overview

**Global values and aliases**. Global utility values are defined in [`_utility-values`](https://github.com/fac/fa-css-utilities/blob/master/_utility-values.scss). Utilities `font-size`, `line-height`, `padding`, `margin`, etc have scales of values, as well as aliases. All aliases live in [`_utility-aliases.scss`](https://github.com/fac/fa-css-utilities/blob/master/_utility-aliases.scss). Aliases provide a finite scale (`x-small`, `default`, `xx-large`, etc) to make authoring easier and more meaningful.

**Local aliases**. You can assign local, project-specific aliases to global values by adding rules to [`_project-aliases`](https://github.com/fac/fa-css-utilities/blob/master/_project-aliases.scss). This way you aren’t continually declaring something like `@include fa-line-height(x-loose)` for your project’s default `line-height`. You can just assign `x-loose` to `default` for your project.

**Meaningful namespacing**. Mixins for any FreeAgent-specific properties are prepended with `fa-`. Simple rule: if we have a custom value for a property (i.e. a value that isn't part of the CSS spec), we have a custom namespace (and associated mixins).

**Turning utility classes on/off**. Utility _classes_ mirror the behaviour of our mixins but can be applied to HTML elements directly. Rendering all of them naturally adds a lot of weight a `.css` file, so they can be individually turned on/off in [`_utility-settings.scss`](https://github.com/fac/fa-origin/blob/master/assets/scss/_utility-settings.scss). Utility classes have `!important` because utilities exist to do _one thing no matter what_.

**Optional `!important`**. `!important` can be added to any mixin declaration, e.g.: `@include fa-padding(large, !important);`. This is especially useful for refactoring; `!important` allows us a way to turn existing UI patterns that rely on the cascade into completely self-contained components — _without_ breaking lots of stuff. Once a component has been created and rolled out, any `!important` arguments can just be removed.

### Examples

Most utilities can be applied two ways: directly to HTML elements as classes, or as mixins in a `.scss` file. Utilities can be added to any element, multiple utilities can be used together, and utilities can be used alongside components.

#### Using mixins in SASS

```scss
.MyComponent {
  @include fa-background-color(gray-13);
  @include fa-font-family(default);
  @include fa-font-size(large);
  @include fa-line-height(tight);
  @include fa-text-color(fa-blue);
}

.MyOtherComponent {
  @include fa-margin-top(large);
  @include flexbox(flex);
  @include flex-direction(row-reverse);
  @include flex-justify-content(center);
  @include flex-grow(2);
  @include flex-shrink(0);
}
```

#### Using utility classes in HTML
Utility classes are useful for prototyping ideas, but treat them as temporary (remember they apply `!important`). Components should handle their own states and variants, so there should be relatively few utility classes being used in production.

**You might start with this&hellip;**

```html
<div class="u-margin--0 u-padding--0 u-text-align--center u-border-radius--default u-border--thin--solid--fa-blue u-line-height--tight u-flexbox u-flex-align-items--stretch u-flex-direction--row">
  <button class="u-background--none u-display--inline-block u-margin--0 u-border-right--thin--solid--blue u-padding--x-small--small u-text-color--x-light u-flex-grow--1 u-text-truncate">Payment</button>
  <button class="u-background--none u-display--inline-block u-margin--0 u-padding--x-small--small u-text-color--x-light u-flex-grow--1 u-text-truncate">Refund</button>
</div>
```

**&hellip;but you should end up with:**

```html
<div class="SegmentedControl">
  <button class="SegmentedControl-segment">Payment</button>
  <button class="SegmentedControl-segment">Refund</button>
</div>
```

```scss
.SegmentedControl {
  margin: 0;
  padding: 0;
  text-align: center;
  @include fa-border-radius(default);
  @include fa-border(thin, solid, fa-blue);
  @include fa-line-height(tight);
  @include flexbox(flex);
  @include flex-align-items(stretch);
  @include flex-direction(row);

.SegmentedControl-segment {
  background: none;
  display: inline-block;
  margin: 0;
  @include fa-border-right(thin, solid, fa-blue);
  @include fa-padding(x-small, small)
  @include fa-text-color(x-light);
  @include flex-grow(1);
  @include text-truncate;
}
```

#### Syntax
```
.u-<utility>[-descendent][--value]
```

We write our utilities in lower case as they tend to serve as direct representations of actual CSS properties (as opposed to our components which are written in upper camel case). Keeping the syntax closer to actual CSS not only makes utilties more predictable, it also helps to create a further distinction between components and utilities.

### Contributing
All team members should be contributing back to this repo in order to improve it. The process:

1. Make sure you're up to date with the master branch (`git fetch; git pull origin master`)
2. Branch off master (`git checkout -b <your-branch-name>`) and make your changes
3. Increment the version numbers in [package.json](https://github.com/fac/fa-css-utilities/blob/master/package.json) and [bower.json](https://github.com/fac/fa-css-utilities/blob/master/bower.json) ([how to choose a suitable version number](http://semver.org/))
4. Push up your changes (`git push origin <your-branch-name>`) and write a [helpful pull request](https://github.com/blog/1943-how-to-write-the-perfect-pull-request) describing your changes
5. Ask a fellow designer to review your changes. Make any required changes, then merge your branch into master: `git checkout master; git merge --no-ff <your-branch-name>`
6. Push up the new version of master (`git push origin master`), then [create a new release](https://help.github.com/articles/creating-releases/) with a useful description
7. [Update the NPM package](https://docs.npmjs.com/getting-started/publishing-npm-packages) (`npm publish`) with a new version number. If you don't yet have access to update the NPM package, have someone in the design team add as a contributor. There's no need to manually update the Bower package, as Bower relies solely on git tags for package version information.
8. Consider updating the `fa-css-utilities` version numbers in `package.json` for any other projects that should receive these updates. [FA Origin](https://github.com/fac/fa-origin#installation) almost always should, so update that!

#### How To…

**Add a new colour variable**
To add a new colour simply add your colour to the *Colors* section in [_utility-values.scss](https://github.com/fac/fa-css-utilities/blob/master/_utility-values.scss).
Declare your new colour using the `rgb(0, 0, 0)` format, and give it a sensible name. New colours should follow the same naming syntax as existing colours: $color--fa-*colour-name*--*variant*.


### Acknowledgements
* [Nicolas Gallagher](https://github.com/necolas) particularly for his work on [SUIT CSS](https://suitcss.github.io/), which has informed much of the thinking behind this work
* [Brian Franco](https://github.com/mastastealth) for the excellent [SASS flex mixin](https://github.com/mastastealth/sass-flex-mixin) we used as the basis for our own partials

### To do
* Allow `margin` and `padding` to accept negative values
* Allow `linear-gradient` mixin to accept color map and `!important` values
* Allow `font-kerning` mixin to accept multiple values
