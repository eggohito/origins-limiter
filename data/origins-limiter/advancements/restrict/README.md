This folder is for creating advancements that are used for detecting whether a certain origin or origin layer should be restricted. The advancements don't necessarily need to use triggers other than `minecraft:impossible`, since the advancements are manually granted/revoked anyway.
<br>

The file structure for this folder is as follows, where `<namespace>` being the folder used for storing the origin/origin layer, and `<path>` being the name of the origin/origin layer:
<pre>

data/origins-limiter/advancements
└───restrict
    ├───layer
    │   └───&#60;namespace&#62;
    │           &#60;path&#62;.json
    │
    └───origin
        └───&#60;namespace&#62;
                &#60;path&#62;.json

</pre>