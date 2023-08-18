This is the folder for creating an origin layers that are used as some sort of "confirmation" screen that determines whether the player can choose the origin or cancel the process of picking an origin. Origin layers that are created in this folder should have an `order` value that is higher (at least by 1) than the targeted origin layer.
<br>

**You do not need to modify the `after` and `before` origin layers, as these are only used internally**.
<br>

The file structure for this folder is as follows, where `<namespace>` being the folder used for storing the origin layer, and `<path>` being the name of the origin layer:
<pre>

data/origins-limiter/origin_layers
└───restrict
    │   after.json
    │   before.json
    │
    └───&#60;namespace&#62;
            &#60;path&#62;.json

</pre>
