.class final LSLWaContactSearch$Contact;
.super Ljava/lang/Object;
.source "SLWaContactSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LSLWaContactSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Contact"
.end annotation


# instance fields
.field final name:Ljava/lang/String;

.field final phone:Ljava/lang/String;

.field photo:Landroid/graphics/Bitmap;

.field final photoUri:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    iput-object p1, p0, LSLWaContactSearch$Contact;->name:Ljava/lang/String;

    iput-object p2, p0, LSLWaContactSearch$Contact;->phone:Ljava/lang/String;

    iput-object p3, p0, LSLWaContactSearch$Contact;->photoUri:Ljava/lang/String;

    .line 136
    return-void
.end method
