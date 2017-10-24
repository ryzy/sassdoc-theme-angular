# SassDoc theme for Angular

**WIP**

Generate sass documentation which can be embedded in Angular (>= 4) app.

```typescript
@Component({
  selector: 'stylebook-page',
  templateUrl: './sassdoc/index.html',
  styleUrls: ['./stylebook-page.component.scss']
})
export class StylebookPageComponent {}
```

---

## About SassDoc Default Theme

This theme is forked and based on [sass-theme-default](https://github.com/SassDoc/sassdoc-theme-default) created by SassDoc team.

This theme uses [Themeleon](https://github.com/themeleon/themeleon) as a theme engine, and [themeleon-swig](https://github.com/themeleon/themeleon-swig) as a template engine, directly plugged into Themeleon.

Because this is likely to be the most used theme of all, it is not as simple as a theme can get. For instance, there is quite a bit of logic in both `index.js` and the Swig templates. Fortunately, you don't have to deal with that at all.

---

# Credits
* [SassDoc](https://github.com/SassDoc)
* [Marcin 'ryzy' Ryzycki](https://twitter.com/ryzmen)

# License

MIT
