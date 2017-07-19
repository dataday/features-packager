# Features Packager Gem

This utility was created to package custom [feature](https://github.com/cucumber/cucumber/wiki/Gherkin) files into an application specific gem. It can be cloned and used for applications where static features need to be shared with a external frameworks, for example, packaging features to be installed as a gem by a downstream test suite on an automated build and release environment. The gem can be renamed to whatever makes most sense to your implimentation.

## Download

```
$ git clone git@github.com:dataday/features-packager.git features-packager
$ cd features-packager
```

## Build and Install

Build and install the gem locally.

```
# Add your static feature files to ~/features, then.
$ gem build features-packager.gemspec; gem install features-packager
```

Please note that `--user-install` maybe required to install the gem locally and if no [Ruby Version Manager (RVM)](https://en.wikipedia.org/wiki/Ruby_Version_Manager) is installed. It is recommended that you use a stable up-to-date RVM.

## Usage

The following commands have been provided.

```
$ features-packager version
$ features-packager help
```

`List` features ahead of publishing them.

```
$ features-packager features list all
```

`Publish` features to a custom directory.

```
$ features-packager features publish /path/to/directory
```

`Clear` features from a custom directory.

```
$ features-packager features clear /path/to/directory
```

## Documentation

The following command will publish documentation associated to the gem.

```
$ yardoc
```

The following command will run [RuboCop](https://github.com/bbatsov/rubocop) static code analyzer.

```
$ rubocop
```

## Versioning

This gem uses [Semantic Versioning](http://semver.org).

## License

This gem is licensed under the [MIT LICENSE](./MIT-LICENSE).

## Caveats

Please note that [Thor](https://github.com/erikhuda/thor) also provides command line support but at the time of writing [cmdparse](https://github.com/m0cchi/cmdparser) was used. Once Thor version [0.20.0](https://github.com/erikhuda/thor/blob/df5ba2b653a28087b3617d6c082b00866b0c0d6c/CHANGELOG.md) is released it is likely that I will rewrite this gem and improve on it, so, this is just a heads up.

## Author

- [dataday](http://github.com/dataday)
