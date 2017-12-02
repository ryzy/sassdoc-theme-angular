# SassDoc theme for Angular
[![CircleCI](https://circleci.com/gh/ryzy/sassdoc-theme-angular.svg?style=svg)](https://circleci.com/gh/ryzy/sassdoc-theme-angular)

**Easily generate Styleguide for your Angular project**. 

**WARNING: Very WIP**

## What is Styleguide

Styleguide is a live documentation of your visual language (styles) present in the project. It goes through project's CSS codebase and extracts information from there to build a comprehensive list of all headlines, buttons, components etc. The Styleguide site is a place where it is all visually presented, in some order and in an easy to browse form. You perhaps agree that reading the raw CSS code doesn't give you the same level of experience and it's just plain hard or even impossible to visualise what you read?

Styleguide, when it lists all used styles, elements, components etc, is a tool both for developers and designers. Developers can see what is currently in the code base and have easy access to code snippets to achieve desired visual look. Designers can see what's already there and re-use existing components of the visual language they created previously. And they can collaborate more effectively about adding new items or variants of existing items.

Visit http://styleguides.io to learn more about theory around all that. One of good examples of what Stylebook is and what it can provide is here: http://carbondesignsystem.com.


## What is SassDoc

[SassDoc](http://sassdoc.com/) is a tool to parse CSS (more explicitly: .sass files) and extract from there necessary information to build Stylebook. You need to document your CSS code (in a similar way to JsDoc) and SassDoc gives you few @annotations helping with that. One of them is `@example` which lets you give plain HTML example how to apply given class or mixin, which will be rendered as is. This project **`sassdoc-theme-angular`** is based on SassDoc's default theme, [sassdoc-theme-default](https://github.com/SassDoc/sassdoc-theme-default), so it offers everything which 


## What does it have to do with Angular

Angular is a platform to build sophisticated apps. And these sophisticated apps surely have plenty of components and directives, which should and need to be presented and documented on the Stylebook website. That's the problem we try to solve here. You've built that awesome button or that groovy component and you want it to be rendered on the Stylebook site. It should be rendered by Angular, with all nested structures and bindings etc. And it's not easy to render these _outside_ of Angular context.

What we do here is we generate Angular-friendly .html output. These .html files are then picked by the Stylebook components, which are part of your app (unless you decide to built it as a separate app). Thus, entire SassDoc-generated documentation runs inside Angular context and your app.

---

## Usage

* All documentation from the [SassDoc](http://sassdoc.com/) website applies. Follow the instructions there about how to install and configure it. Initially use the default theme, make it all up & running. As a result you should get static version of your Stylebook website, generated from your .sass files.

* **TODO** Write detailed instructions how to switch to this theme and how to add it all to Angular project.

```typescript
@Component({
  selector: 'stylebook-page',
  templateUrl: './sassdoc/index.html',
  styleUrls: ['./stylebook-page.component.scss']
})
export class StylebookPageComponent {}
```

---

# Credits
* [SassDoc team](https://github.com/SassDoc)
* [Marcin 'ryzy' Ryzycki](https://twitter.com/ryzmen)

# License

MIT
