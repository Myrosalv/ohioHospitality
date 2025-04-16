//
//  WPWebView.swift
//  ohioHospitality
//
//  Created by Myroslav Kohut on 4/16/25.
//

import SwiftUI
import WebKit

struct WPWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.scrollView.isScrollEnabled = true
        webView.scrollView.bounces = false
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(URLRequest(url: url))
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            let js = """
            const hideStuff = setInterval(() => {
                const header = document.getElementById('site-header');
                if (header) header.remove();

                const footer = document.getElementById('site-footer');
                if (footer) footer.remove();

                const hClass = document.querySelector('.site-header');
                if (hClass) hClass.remove();

                const fClass = document.querySelector('.site-footer');
                if (fClass) fClass.remove();

                if (!document.getElementById('site-header') &&
                    !document.querySelector('.site-header') &&
                    !document.getElementById('site-footer') &&
                    !document.querySelector('.site-footer')) {
                    clearInterval(hideStuff);
                }
            }, 300);
            """
            webView.evaluateJavaScript(js, completionHandler: nil)
        }
    }
}
