# Rust concepts covered

Depths and who raises them: `.claude/learning-projects.md`.

| Concept | Depth | Where it came up |
|---|---|---|
| `f64`: 64-bit decimal, `Copy`; alias and newtype as alternatives | explained | yesterdayWeather: `Celsius(pub f64)` |
| `self`, `&self`, `&mut self`: move, shared borrow, mutable borrow | explained | yesterdayWeather: `degrees(&self)` |
| Associated function without `self` (`between`) vs method | explained | yesterdayWeather: `ThermalSensationChange::between` |
| Tuple struct and `.0`; accessor method instead of `.0` | explained | yesterdayWeather: `Celsius` |
| Variables immutable by default, `mut` to reassign | explained | yesterdayWeather: `band()` |
| Last expression without `;` is the returned value | seen | yesterdayWeather: `band()`, `reaches()` |
| `enum` variants, path `DifferenceBand::X` | seen | yesterdayWeather: `DifferenceBand` |
| `#[derive(Debug, PartialEq)]` for `assert_eq!` | seen | yesterdayWeather: `DifferenceBand` |
| `#[derive(Clone, Copy)]`: copy instead of move | explained | `THRESHOLDS` returns bands by value |
| `.iter()` in a `for` loop borrows each element | seen | yesterdayWeather: `band()` |
| `const` array of structs | seen | yesterdayWeather: `THRESHOLDS` |
| Private by default, `pub` to expose | seen | yesterdayWeather: `Threshold` is not `pub` |
| `rustfmt.toml` and `max_width` | explained | 80 columns |
| `format!` builds a `String`; `{}` placeholders filled by the arguments | explained | yesterdayWeather: `Summary::text` |
| Format spec `{:+.1}`: `+` forces the sign, `.1` one decimal | explained | yesterdayWeather: `Summary::text` |
| `String` (owned, returned) vs `&str` literal (borrowed, fixed text) | seen | yesterdayWeather: `text() -> String` |
| `\` at the end of a string line continues it, skipping the next indentation | seen | yesterdayWeather: `Summary::text` |
| `pub struct` with private fields and a `pub fn of(...)` constructor | seen | yesterdayWeather: `Summary` |
| `match` on an enum: one arm per variant, must be exhaustive, is an expression | explained | yesterdayWeather: `Summary::comparison` |
| Returning `&str` from `&self`: the literal lives for the whole program, so the borrow is valid | seen | yesterdayWeather: `Summary::comparison` |
| Private tuple field: `Celsius(f64)` is built only inside its file; outside, a public constructor | explained | yesterdayWeather: `Celsius::new` |
| `new` is a naming convention for a constructor, not a keyword | seen | yesterdayWeather: `Celsius::new` |
| Privacy is per module: private items are visible in the same file and its child modules, not from `tests/` | explained | yesterdayWeather: `degrees()` read by `Summary` |
| `Vec<T>`: growable list that owns its items; `Vec::new()` and `push` (needs `mut`) | explained | yesterdayWeather: `WeatherSeries` |
| Range `0..48`: from 0 up to, not including, 48 | explained | `Sut` loop |
| `vec[i]` reads by position and panics if `i` is out of range | explained | yesterdayWeather: `change()` |
| Reading `vec[i]` copies the item out, so the item type needs `Copy` | explained | yesterdayWeather: `#[derive(Clone, Copy)]` on `Celsius` |
| `usize::from(u8)`: lossless widening; `usize` is the type of positions | explained | yesterdayWeather: `change()` |
| `Result<T, E>`: `Ok(value)` or `Err(error)`; a function that can fail returns one | explained | yesterdayWeather: `WeatherSeries::new` |
| Own error `enum` with `#[derive(Debug, PartialEq)]` | explained | yesterdayWeather: `WeatherError` |
| `Option<T>` (`Some`/`None`) and `.expect("msg")` on `Option` and `Result`: take the value or panic with the message | explained | yesterdayWeather: `Sut::band`, `Sut::error` |
| `.err()` turns a `Result` into the `Option` of its error | seen | yesterdayWeather: `Sut::error` |
| `self` by value (no `&`): the method consumes the value, which cannot be used afterward | seen | yesterdayWeather: `Sut::band(self)` |
| `for _ in 0..n`: `_` names a value you do not use | seen | yesterdayWeather: `Sut::with_count_at_hour` |
| `trait`: a named set of methods a type promises to have; `impl Trait for Type` makes the promise | explained | yesterdayWeather: `WeatherSource`, `FakeWeatherSource` |
| Generic struct `Struct<S: Trait>`: `S` is any type that implements the trait, fixed at compile time | explained | yesterdayWeather: `YesterdayComparison<S>` |
| `impl<S: Trait> Struct<S>`: the `impl` block repeats the generic parameter | explained | yesterdayWeather: `YesterdayComparison` |
| `?` after a `Result`: on `Err` return it from the function, on `Ok` unwrap the value | explained | yesterdayWeather: `summary()` |
| `.clone()` makes an owned copy of a non-`Copy` value such as a `Vec` | seen | yesterdayWeather: `FakeWeatherSource` |
| `&[String]`: a slice, a borrowed view of a list; `&owned` turns a `Vec<String>` into one | explained | yesterdayWeather: `Location::from_args` |
| `text.parse::<f64>()`: text to number, returns a `Result`; `::<f64>` names the target type (turbofish) | explained | yesterdayWeather: `degrees_within` |
| `if let Some(x) = option`: run the block only when the `Option` has a value | explained | yesterdayWeather: `degrees_within` |
| `match` arm with a guard: `Ok(n) if n.abs() <= limit => ...` | explained | yesterdayWeather: `degrees_within` |
| `_` as a catch-all `match` arm | seen | yesterdayWeather: `degrees_within` |
| `slice.get(i)` returns `Option<&T>` instead of panicking like `slice[i]` | explained | yesterdayWeather: `degrees_after` |
| `const` with a primitive type | seen | yesterdayWeather: `ARGUMENT_COUNT` |
| `use path::Item;` brings a name into scope | seen | yesterdayWeather: `ParseFloatError` |
| `mod name;` in `lib.rs` declares a module whose code lives in `name.rs` | explained | yesterdayWeather: `lib.rs` |
| `pub use module::Item;` re-exports, so outsiders write `crate_name::Item` and not `crate_name::module::Item` | explained | yesterdayWeather: `lib.rs` |
| `use crate::module::Item;` imports from another module of the same crate | explained | yesterdayWeather: `summary.rs` |
| `pub(crate)`: visible in the whole crate, hidden from `tests/` and other crates | explained | yesterdayWeather: `Celsius::degrees` |

Not covered yet: lifetimes, ownership of non-`Copy` values.
