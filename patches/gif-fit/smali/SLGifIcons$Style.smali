.class final LSLGifIcons$Style;
.super Ljava/lang/Object;
.source "SLGifIcons.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LSLGifIcons;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Style"
.end annotation


# instance fields
.field mode:I

.field shape:I

.field size:I


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;I)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    invoke-static {p2}, LSLGifIcons;->access$000(I)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5a

    invoke-static {p1, v0, v1}, LSLGifIcons;->access$100(Landroid/content/SharedPreferences;Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, LSLGifGeometry;->size(I)I

    move-result v0

    iput v0, p0, LSLGifIcons$Style;->size:I

    .line 52
    invoke-static {p2}, LSLGifIcons;->access$200(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2}, LSLGifIcons;->access$100(Landroid/content/SharedPreferences;Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, LSLGifGeometry;->mode(I)I

    move-result v0

    iput v0, p0, LSLGifIcons$Style;->mode:I

    .line 53
    invoke-static {p2}, LSLGifIcons;->access$300(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2}, LSLGifIcons;->access$100(Landroid/content/SharedPreferences;Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, LSLGifGeometry;->shape(I)I

    move-result v0

    iput v0, p0, LSLGifIcons$Style;->shape:I

    .line 54
    return-void
.end method
