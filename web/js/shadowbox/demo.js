// This file is only required to run some of the demos.

function setupDemos() {

    Shadowbox.setup("a.mustang-gallery", {
        gallery:        "mustang",
        continuous:     true,
        counterType:    "skip"
    });

    Shadowbox.setup("a.swf-gallery", {
        gallery:    "swf",
        continuous: true
    });

    Shadowbox.setup('a[title="Sweetness"]', {
        width: 512,
        height: 322,
        flashVars: {
            id:         "v2155043",
            vid:        "2021599",
            autoPlay:   1
        },
        flashParams: {
            AllowScriptAccess: "always",
            allowFullScreen: "true"
        }
    });

    Shadowbox.setup('a[title="The Last Eggtion Hero"]', {
        height:     360,
        width:      640,
        flashVars:  {
            clip_id:    "1893986",
            autoplay:   "1"
        }
    });

    Shadowbox.setup('a[title="While My Ukulele Gently Weeps"]', {
        height:     327,
        width:      400,
        flashVars:  {
            docid:    "1352016870638076087",
            autoplay: "1"
        }
    });

    Shadowbox.setup('a[title="Altaic Warrior - Clipped"]', {
        handleOversize: "none"
    });

    Shadowbox.setup('a[title="Altaic Warrior - Draggable"]', {
        handleOversize: "drag"
    });

}