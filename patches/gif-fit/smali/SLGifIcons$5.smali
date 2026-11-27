.class LSLGifIcons$5;
.super Ljava/lang/Object;
.source "SLGifIcons.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLGifIcons;->adjust(Landroid/app/Activity;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$drawable:LSLGifIcons$GifDrawable;

.field final synthetic val$style:LSLGifIcons$Style;


# direct methods
.method constructor <init>(LSLGifIcons$Style;LSLGifIcons$GifDrawable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 185
    iput-object p1, p0, LSLGifIcons$5;->val$style:LSLGifIcons$Style;

    iput-object p2, p0, LSLGifIcons$5;->val$drawable:LSLGifIcons$GifDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 2

    .prologue
    .line 185
    iget-object v0, p0, LSLGifIcons$5;->val$style:LSLGifIcons$Style;

    invoke-virtual {p1, p2}, Landroid/widget/RadioGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/RadioGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-static {v1}, LSLGifGeometry;->mode(I)I

    move-result v1

    iput v1, v0, LSLGifIcons$Style;->mode:I

    iget-object v0, p0, LSLGifIcons$5;->val$drawable:LSLGifIcons$GifDrawable;

    invoke-virtual {v0}, LSLGifIcons$GifDrawable;->invalidateSelf()V

    return-void
.end method
