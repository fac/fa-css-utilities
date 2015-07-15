# FreeAgent CSS utilities
These CSS utilities are our ‘one true source’ of design properties at FreeAgent, comprising:

* Universal scales and aliases for: `font-size`, `font-family`, `line-height`, `color`, `background-color`, `margin`, `padding`, `border-radius`, and more 
* Library of colours for text and block-level elements
* Mixins and `.u-` utility classes for 40+ CSS properties

This means our properties are managed and versioned in a single place, and we have a universal language for using them across our projects and platforms.

### Install

Utilities aren’t installable as a standalone project (they exist as an [NPM module](https://www.npmjs.com/package/fa-css-utilities)). Installing our starting point for web projects for will bring them in: [FA Origin](https://github.com/fac/fa-origin#installation). 

### Overview

**Global values and aliases**. Global utility values are defined in [`_utility-values`](https://github.com/fac/fa-css-utilities/blob/master/_utility-values.scss). Certain utilities (e.g. `font-size`, `line-height`, spacing, color) have scales of values, as well as aliases. All aliases live in [`_utility-aliases.scss`](https://github.com/fac/fa-css-utilities/blob/master/_utility-aliases.scss). Aliases provide a finite scale (`x-small`, `default`, `xx-large`, etc) to make authoring easier and more meaningful.

**Local aliases**. You can assign local, project-specific aliases to global values by adding rules to [`_project-aliases`](https://github.com/fac/fa-css-utilities/blob/master/_project-aliases.scss). This way you aren’t continually declaring something like `@include fa-line-height(x-loose)` for your project’s default `line-height`. You can just assign `x-loose` to `default` for your project.

**Meaningful namespacing**. Mixins for any FreeAgent-specific properties are prepended with `fa-`. Simple rule: if we have a custom value for a property (i.e. a value that isn't part of the CSS spec), we have a custom namespace (and associated mixins).

**Turning utility classes on/off**. Utility _classes_ mirror the behaviour of our mixins but can be applied to HTML elements directly. Rendering all of them naturally adds a lot of weight a `.css` file, so they can be individually turned on/off in [`_utility-settings.scss`](https://github.com/fac/fa-origin/blob/master/assets/scss/_utility-settings.scss). Utility classes have `!important` because utilities exist to do _one thing no matter what_.

**Optional `!important`**. `!important` can be added to any mixin declaration, e.g.: `@include fa-padding(large, !important);`. This is especially useful for refactoring; `!important` allows us a way to turn existing UI patterns that rely on the cascade into completely self-contained components — _without_ breaking lots of stuff. Once a component has been created and rolled out, any `!important` arguments can just be removed. 

### How to use utilities

Most utilities can be applied two ways: directly to HTML elements as classes, or as mixins in a `.scss` file. Utilities can be added to any element; multiple utilities can be used together; and utilities can be used alongside components.
 
#### Using @include in SCSS
 
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

#### Example: using utility classes in HTML
```html
<div class="u-background-position--bottom-right u-display--inline-block u-margin-bottom--default">
  <h2 class="u-font-size--large u-line-height--large u-text-truncate">
    Extra large heading, with a loose line leight, that will be truncated
  </h2>
  <p class="u-font-weight--300 u-text-color--light-2">
    Paragraph with light font weight and extra extra light text color
  </p>
  <ul class="u-list-item-spacing---large u-list-style--none">
    <li class="u-opacity--0">
      <a class="u-text-decoration--underline--active" href="#">Opaque list item containing an anchor that gets a text underline when :active</a>
    </li>
  </ul>
</div>
```

```html
<div class="u-flexbox u-flex-align-items--stretch u-flex-direction--column-reverse">
  <div class="u-flex-grow--1 u-flex-shrink--0 u-flex-basis--25percent">
    Flexbox item that grows, doesn't shrink, and begins at 25% initial width
  </div>
  <div class="u-flex-grow--2 u-flex-shrink--1 u-flex-basis--auto">
    Flexbox item that grows, shrinks, and has an automatic initial width
  </div>
</div>
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
3. Push up your changes (`git push origin <your-branch-name>`) and write a [helpful pull request](https://github.com/blog/1943-how-to-write-the-perfect-pull-request) describing your changes
4. Ask a fellow designer to review your changes. Make any required changes, then merge your branch into master: `git checkout master; git merge <your-branch-name>`
5. Push up the new version of master (`git push origin master`), then [create a new release](https://help.github.com/articles/creating-releases/) (tip: [choosing version numbers](http://semver.org/))
6. [Update the NPM package](https://docs.npmjs.com/getting-started/publishing-npm-packages) with a new version number. If you don't yet have access to update the NPM package, have someone in the design team add as a contributor.


### Acknowledgements
* [Nicolas Gallagher](https://github.com/necolas) for his work on SUIT
* [Brian Franco](https://github.com/mastastealth) for the excellent [SASS flex mixin](https://github.com/mastastealth/sass-flex-mixin) we used as the basis for our own partials

### To do
* Allow `linear-gradient` mixin to accept color map and `!important` values
* Allow `font-kerning` mixin to accept multiple values