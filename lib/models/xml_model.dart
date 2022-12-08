import 'dart:convert';

PDFModel welcome9FromJson(String str) => PDFModel.fromJson(json.decode(str));

String welcome9ToJson(PDFModel data) => json.encode(data.toJson());

class PDFModel {
    PDFModel({
        required this.xfdf,
    });

    Xfdf xfdf;

    factory PDFModel.fromJson(Map<String, dynamic> json) => PDFModel(
        xfdf: Xfdf.fromJson(json["xfdf"]),
    );

    Map<String, dynamic> toJson() => {
        "xfdf": xfdf.toJson(),
    };
}

class Xfdf {
    Xfdf({
        required this.add,
        required this.modify,
        required this.delete,
        required this.pdfInfo,
    });

    Add add;
    String modify;
    String delete;
    String pdfInfo;

    factory Xfdf.fromJson(Map<String, dynamic> json) => Xfdf(
        add: Add.fromJson(json["add"]),
        modify: json["modify"],
        delete: json["delete"],
        pdfInfo: json["pdf-info"],
    );

    Map<String, dynamic> toJson() => {
        "add": add.toJson(),
        "modify": modify,
        "delete": delete,
        "pdf-info": pdfInfo,
    };
}

class Add {
    Add({
        required this.highlight,
    });

    Highlight highlight;

    factory Add.fromJson(Map<String, dynamic> json) => Add(
        highlight: Highlight.fromJson(json["highlight"]),
    );

    Map<String, dynamic> toJson() => {
        "highlight": highlight.toJson(),
    };
}

class Highlight {
    Highlight({
        required this.popup,
        required this.contents,
        required this.apref,
    });

    String popup;
    String contents;
    String apref;

    factory Highlight.fromJson(Map<String, dynamic> json) => Highlight(
        popup: json["popup"],
        contents: json["contents"],
        apref: json["apref"],
    );

    Map<String, dynamic> toJson() => {
        "popup": popup,
        "contents": contents,
        "apref": apref,
    };
}