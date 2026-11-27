.class LSLWaContactSearch$1;
.super Ljava/lang/Object;
.source "SLWaContactSearch.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LSLWaContactSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LSLWaContactSearch;


# direct methods
.method constructor <init>(LSLWaContactSearch;)V
    .registers 2

    .prologue
    .line 67
    iput-object p1, p0, LSLWaContactSearch$1;->this$0:LSLWaContactSearch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 3

    .prologue
    .line 70
    iget-object v0, p0, LSLWaContactSearch$1;->this$0:LSLWaContactSearch;

    invoke-static {v0}, LSLWaContactSearch;->access$000(LSLWaContactSearch;)V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .prologue
    .line 68
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .prologue
    .line 69
    return-void
.end method
