.class LSLGifIcons$4;
.super Ljava/lang/Object;
.source "SLGifIcons.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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

.field final synthetic val$sizeLabel:Landroid/widget/TextView;

.field final synthetic val$style:LSLGifIcons$Style;


# direct methods
.method constructor <init>(LSLGifIcons$Style;Landroid/widget/TextView;LSLGifIcons$GifDrawable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 179
    iput-object p1, p0, LSLGifIcons$4;->val$style:LSLGifIcons$Style;

    iput-object p2, p0, LSLGifIcons$4;->val$sizeLabel:Landroid/widget/TextView;

    iput-object p3, p0, LSLGifIcons$4;->val$drawable:LSLGifIcons$GifDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 3

    .prologue
    .line 180
    iget-object v0, p0, LSLGifIcons$4;->val$style:LSLGifIcons$Style;

    add-int/lit8 v1, p2, 0x32

    invoke-static {v1}, LSLGifGeometry;->size(I)I

    move-result v1

    iput v1, v0, LSLGifIcons$Style;->size:I

    iget-object v0, p0, LSLGifIcons$4;->val$sizeLabel:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, LSLGifIcons$4;->val$style:LSLGifIcons$Style;

    iget v2, v2, LSLGifIcons$Style;->size:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, LSLGifIcons$4;->val$drawable:LSLGifIcons$GifDrawable;

    invoke-virtual {v0}, LSLGifIcons$GifDrawable;->invalidateSelf()V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .prologue
    .line 181
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .prologue
    .line 181
    return-void
.end method
