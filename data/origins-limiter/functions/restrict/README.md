This folder is for creating functions that are used for detecting and restricting a certain origin or origin layer. Origin layers are included to validate whether it should be restricted, reset the origin of the player in the targeted origin layer and display a message whenever the player canceled the process of picking an origin for the targeted origin layer.
<br>

In the case for origins, functions are used to set the default max players that can choose the targeted origin, count how many players have the targeted origin *(excluding certain players that fulfill the conditions to be exempted)* and to grant/revoke the advancement for the corresponding targeted origin to essentially prevent the player from being able to choose the targeted origin.
<br>

The file structure for this folder is as follows, where `<namespace>` being the folder used for storing the origin/origin layer, and `<path>` being the name of the origin/origin layer:
<pre>

data/origins-limiter/functions
└───restrict
    ├───layer
    │   ├───after
    │   │   └───&#60;namespace&#62;
    │   │           &#60;path&#62;.mcfunction
    │   │
    │   └───before
    │       └───&#60;namespace&#62;
    │               &#60;path&#62;.mcfunction
    │
    └───origin
        └───&#60;namespace&#62;
                &#60;path&#62;.json

</pre>
