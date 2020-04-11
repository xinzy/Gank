//
//  H5Code.swift
//  Gank
//
//  Created by Yang on 2020/4/11.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import Foundation

let H5_CODE = """
<!doctype html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <style>
            img {
                max-width: 100%;
                height: auto;
            }
            .post-content p,
            .post-content figure {
                margin-bottom: 1.25rem;
                font-size: 0.9375rem;
                line-height: 1.8;
                word-wrap: break-word;
            }

            .post-content a:not(.btn) {
                color: #448EF6;
                text-decoration: underline;
            }

            .post-content img {
                max-width: 100%;
                height: auto;
            }

            .post-content h1,
            .post-content h2,
            .post-content h3,
            .post-content h4,
            .post-content h5,
            .post-content h6 {
                margin-bottom: 1rem;
            }

            .post-content h1 {
                font-size: 1.625rem;
            }

            .post-content h2 {
                font-size: 1.25rem;
                border-left: 3px solid #448EF6;
                padding-left: 15px;
            }

            .post-content h3 {
                position: relative;
                font-size: 1.125rem;
                padding-left: 20px;
            }

            .post-content h3:before {
                content: '';
                position: absolute;
                top: 10px;
                left: 0;
                height: 8px;
                width: 8px;
                border-radius: 20px;
                background-color: #448EF6;
            }

            .post-content h4 {
                font-size: 1rem;
                padding-bottom: .5rem;
                border-bottom: 1px solid #f2f2f5;
            }

            .post-content h5,
            .post-content h6 {
                font-size: .875rem;
            }

            .post-content h2.quote {
                font-size: 1.25rem;
                color: #2d3757;
                padding-bottom: 1rem;
                border-bottom: solid 1px #f0f4f7;
            }

            .post-content ul {
                list-style: disc;
            }

            .post-content ol {
                list-style: decimal;
            }

            .post-content ul,
            .post-content ol {
                margin: 0 0 20px 45px;
                font-size: .875rem;
            }

            .post-content ul li,
            .post-content ol li {
                margin: 15px 0;
            }

            .post-content .btn[class*=btn-] {
            }

            pre {
                margin-top: 0;
                margin-bottom: 1rem;
                overflow: auto
            }
            pre code {
                font-size: inherit;
                color: inherit;
                word-break: normal
            }
            code,kbd,pre,samp {
                font-family: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
                font-size: 1em
            }

            code {
                font-size: 87.5%;
                color: #e83e8c;
                word-break: break-word
            }

            a>code {
                color: inherit
            }

            kbd {
                padding: .2rem .4rem;
                font-size: 87.5%;
                color: #fff;
                background-color: #212529;
                border-radius: .2rem
            }

            kbd kbd {
                padding: 0;
                font-size: 100%;
                font-weight: 700
            }
        </style>
    </head>

    <body>
        <div class="post-content">
            %@
        </div>
    </body>
</html>
"""

func formatH5(_ content: String) -> String {
    String(format: H5_CODE, content)
}
