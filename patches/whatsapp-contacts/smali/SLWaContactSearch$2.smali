.class LSLWaContactSearch$2;
.super Ljava/lang/Object;
.source "SLWaContactSearch.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLWaContactSearch;->schedule()V
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
    .line 100
    iput-object p1, p0, LSLWaContactSearch$2;->this$0:LSLWaContactSearch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .prologue
    .line 100
    iget-object v0, p0, LSLWaContactSearch$2;->this$0:LSLWaContactSearch;

    invoke-static {v0}, LSLWaContactSearch;->access$100(LSLWaContactSearch;)V

    return-void
.end method
