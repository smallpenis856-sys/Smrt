.class LSLGifIcons$9$2;
.super Ljava/lang/Object;
.source "SLGifIcons.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLGifIcons$9;->onShow(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LSLGifIcons$9;


# direct methods
.method constructor <init>(LSLGifIcons$9;)V
    .locals 0

    .prologue
    .line 198
    iput-object p1, p0, LSLGifIcons$9$2;->this$0:LSLGifIcons$9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 199
    iget-object v0, p0, LSLGifIcons$9$2;->this$0:LSLGifIcons$9;

    iget-object v0, v0, LSLGifIcons$9;->val$slider:Landroid/widget/SeekBar;

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object v0, p0, LSLGifIcons$9$2;->this$0:LSLGifIcons$9;

    iget-object v0, v0, LSLGifIcons$9;->val$fit:Landroid/widget/RadioGroup;

    iget-object v1, p0, LSLGifIcons$9$2;->this$0:LSLGifIcons$9;

    iget-object v1, v1, LSLGifIcons$9;->val$fit:Landroid/widget/RadioGroup;

    invoke-virtual {v1, v2}, Landroid/widget/RadioGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    iget-object v0, p0, LSLGifIcons$9$2;->this$0:LSLGifIcons$9;

    iget-object v0, v0, LSLGifIcons$9;->val$shape:Landroid/widget/RadioGroup;

    iget-object v1, p0, LSLGifIcons$9$2;->this$0:LSLGifIcons$9;

    iget-object v1, v1, LSLGifIcons$9;->val$shape:Landroid/widget/RadioGroup;

    invoke-virtual {v1, v2}, Landroid/widget/RadioGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 200
    return-void
.end method
