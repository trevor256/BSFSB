#!/bin/bash
cargo install trunk
rustup target add wasm32-unknown-unknown
read -p 'name new web project: ' wvar
cargo new $wvar
cd $wvar
mkdir files

printf 'use yew::prelude::*;

#[function_component(App)]
fn app() -> Html {
    html! {
        <h1>{ "Hello World" }</h1>
    }
}

fn main() {
    yew::start_app::<App>();
}' > src/main.rs

printf '
<!DOCTYPE html>
<html lang="en">
    <head> </head>
    <body></body>
</html>' > index.html

echo 'yew = "^0.19"' >> Cargo.toml
cargo run
trunk serve --open
