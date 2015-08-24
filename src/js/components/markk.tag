<markk>

    <div class="pure-menu pure-menu-horizontal">
        <ul class="pure-menu-list">
            <li class="pure-menu-item">
                <a href="#" class="pure-menu-link pure-menu-heading">Markk</a>
            </li>
            <li class="pure-menu-item">
                <div class="pure-control-group">
                    <label for="title">Title</label>
                    <input id="title" class="title-doc" type="title" value="{ this.doc.title }" placeholder="title">
                </div>
            </li>
            <li class="pure-menu-item">
                <a href="#" class="pure-menu-link" onclick="{ toggleOptions }">Options</a>
            </li>
            <div class="{ options-hidden: this.hideOptions}">
                <li class="pure-menu-item"><a href="#" class="{ pure-button-primary: this.state == 'html'} pure-menu-link" onclick="{ toggleRendered }">HTML</a></li>
                <li class="pure-menu-item"><a href="#" class="{ pure-button-primary: this.zenmode} pure-menu-link" onclick="{ toggleZenmode }">Zen mode</a></li>
                <li class="pure-menu-item"><a href="#" class="{ pure-button-primary: this.fullscreen} pure-menu-link" onclick="{ toggleFullscreen }">Preview</a></li>
            </div>
        </ul>
    </div>

    <div class="pure-g">
        <div if="{ !this.fullscreen }" class="{ pure-u-1: this.zenmode, pure-u-1-2: !this.zenmode }">
            <div class="markdown-te">
                <textarea onkeyup="{ edit }">{ this.doc.md }</textarea>
            </div>
        </div>
        <div class="{ pure-u-1: this.fullscreen, pure-u-1-2: !this.fullscreen } markdown">
            <div class="markdown__html" if={this.state == 'html'}>
                { this.html }
            </div>
            <div class="markdown__rendered" if={this.state == 'rendered'}>
                <div name="rh"></div>
            </div>
        </div>

    </div>

    <!-- this script tag is optional -->
    <script>
        this.fullscreen = false;
        this.hideOptions = true;
        this.zenmode = false;
        this.state="rendered";
        this.doc = {
            md : "#Hello Markk\n###Markk is super lightweight full blown markdown editor",
            title : "Markk title"
        };
        this.html = markdown.toHTML(this.doc.md).replace(" ","\n");
        this.rh.innerHTML = this.html;

        edit(event) {
            this.html = markdown.toHTML(event.target.value);
            this.rh.innerHTML = this.html;
        }

        toggleZenmode() {
            this.zenmode = !this.zenmode;
        }

        toggleFullscreen() {
            this.fullscreen = !this.fullscreen;
        }

        toggleRendered() {
            if (this.state == 'rendered') {
                this.state = 'html';
            } else {
                this.state = 'rendered';
            }
        }

        toggleOptions() {
            this.hideOptions = !this.hideOptions;
        }
    </script>

    <style media="screen">

    * {
        outline: none!important;
    }

    body {
        font-family: 'Noto Sans', sans-serif;
    }

    textarea {
        box-sizing: border-box;
        border: none;
        width: 100%;
        min-height: 600px;
        padding: 1.3em;
        line-height: 1.3em;
        max-width: 900px;
        font-family: courier;
        background-color: #042029;
        color: #819090;
        font-size: 12pt;
        border: none;
        outline: none;
        resize: none;
    }

    .markdown-te {
        background-color: #042029;
        text-align: center;
    }

    .markdown__rendered, .markdown__html {
        padding: 20px;
        padding-top: 0px;
    }

    .markdown__rendered {
        max-width: 900px;
        width: auto;
        margin: 0 auto;
    }

    .title-doc {
        border: none;
        border-bottom: 2px solid lightgray;
    }

    .pure-menu-list {
        width: 100%;
    }

    .options-hidden {
        display: none;
    }

    </style>

</markk>

//http://pouchdb.com/
